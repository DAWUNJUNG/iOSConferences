import SwiftUI

struct ConferenceList: View {
    @State var all_data: String = ""
    @State var kor_data: String = ""
    @State var jap_data: String = ""
    @State var cha_data: String = ""
    @State var asia_data: String = ""
    @State var bunsic_data: String = ""
    @State var get_data = Array<String>()
    @State var best_menu = Array<String>()
    @State var shop_name: String = ""

    var body: some View {
        TabView {
            NavigationView {
                List {
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "전체"]) { (success, data) in
                                self.kor_data = ""
                                self.jap_data = ""
                                self.cha_data = ""
                                self.asia_data = ""
                                self.bunsic_data = ""
                                self.all_data = data as! String
                            }
                        }) {
                            Text("전체")
                        }
                        Text(self.all_data)
                    }
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "한식"]) { (success, data) in
                                self.all_data = ""
                                self.jap_data = ""
                                self.cha_data = ""
                                self.asia_data = ""
                                self.bunsic_data = ""
                                self.kor_data = data as! String
                            }
                        }) {
                            Text("한식")
                        }
                        Text(self.kor_data)
                    }
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "일식"]) { (success, data) in
                                self.all_data = ""
                                self.kor_data = ""
                                self.cha_data = ""
                                self.asia_data = ""
                                self.bunsic_data = ""
                                self.jap_data = data as! String
                            }
                        }) {
                            Text("일식")
                        }
                        Text(self.jap_data)
                    }
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "중식"]) { (success, data) in
                                self.all_data = ""
                                self.kor_data = ""
                                self.jap_data = ""
                                self.asia_data = ""
                                self.bunsic_data = ""
                                self.cha_data = data as! String
                            }
                        }) {
                            Text("중식")
                        }
                        Text(self.cha_data)
                    }
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "아시아_양식"]) { (success, data) in
                                self.all_data = ""
                                self.kor_data = ""
                                self.jap_data = ""
                                self.cha_data = ""
                                self.bunsic_data = ""
                                self.asia_data = data as! String
                            }
                        }) {
                            Text("아시아_양식")
                        }
                        Text(self.asia_data)
                    }
                    HStack {
                        Button(action: {
                            request("http://lacy.co.kr:39211/api/menu_picker", "POST", ["type": "분식"]) { (success, data) in
                                self.all_data = ""
                                self.kor_data = ""
                                self.jap_data = ""
                                self.cha_data = ""
                                self.asia_data = ""
                                self.bunsic_data = data as! String
                            }
                        }) {
                            Text("분식")
                        }
                        Text(self.bunsic_data)
                    }
                }.navigationBarTitle("메뉴 추첨")
            }.tabItem {
                Image(systemName: "filemenu.and.selection")
                Text("메뉴")
            }
            NavigationView {
                List {
                    NavigationLink("전체", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                    NavigationLink("한식", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                    NavigationLink("일식", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                    NavigationLink("중식", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                    NavigationLink("아시아_양식", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                    NavigationLink("분식", destination:
                    shop_details_all(menu_arr: $best_menu, shop_name: $shop_name)
                            .onAppear {
                                request2("http://lacy.co.kr:39211/api/shop_picker", "POST", ["type": "전체"]) { (success, data) in
                                    get_data.removeAll()
                                    shop_name = ""
                                    best_menu.removeAll()
                                    get_data.append(contentsOf: data as! Array<String>)
                                    shop_name = get_data[0]
                                    get_data.remove(at: 0)
                                    best_menu.append(contentsOf: get_data as! Array<String>)
                                }
                            })
                }.navigationBarTitle("식당 추첨")
            }.tabItem {
                Image(systemName: "house.circle")
                Text("식당")
            }
        }
    }
}

class ConferenceList_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceList()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ConferenceList_Previews.previews)
    }
    #endif
}
