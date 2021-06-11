import UIKit
import Foundation

struct Response: Codable {
    let ResultCode: String
    let ResultMessage: String
    let recommend_menu: String
}

struct Response2: Codable {
    let ResultCode: String
    let ResultMessage: String
    let best_menu: Array<String>
    let shop_name: String
}

/* Body가 있는 요청 */
func requestPost2(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
    let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])

    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = method
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = sendData

    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        guard let data = data else {
            print("Error: Did not receive data")
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        guard let output = try? JSONDecoder().decode(Response2.self, from: data) else {
            print("Error: JSON Data Parsing failed")
            return
        }
        completionHandler(true, output.best_menu)
        completionHandler(true, output.shop_name)
    }.resume()
}

/* Body가 있는 요청 */
func requestPost(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
    let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])

    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = method
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = sendData

    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        guard let data = data else {
            print("Error: Did not receive data")
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        guard let output = try? JSONDecoder().decode(Response.self, from: data) else {
            print("Error: JSON Data Parsing failed")
            return
        }

        completionHandler(true, output.recommend_menu)
    }.resume()
}

/* 메소드별 동작 분리 */
func request(_ url: String, _ method: String, _ param: [String: Any]? = nil, completionHandler: @escaping (Bool, Any) -> Void) {
        requestPost(url: url, method: method, param: param!) { (success, data) in
            completionHandler(success, data)
        }
}
func request2(_ url: String, _ method: String, _ param: [String: Any]? = nil, completionHandler: @escaping (Bool, Any) -> Void) {
        requestPost2(url: url, method: method, param: param!) { (success, data) in
            completionHandler(success, data)
        }
}