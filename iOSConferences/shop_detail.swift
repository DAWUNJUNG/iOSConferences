//
// Created by LACY on 2021/06/11.
//

import SwiftUI

struct shop_details_all: View {
    @Binding var menu_arr: Array<String>
    @Binding var shop_name: String

    var body: some View {
        List {
            VStack() {
                Text("식당이름")
            }
            VStack() {
                Text("대표메뉴1")
            }
            VStack() {
                Text("대표메뉴2")
            }
            VStack() {
                Text("대표메뉴3")
            }
        }.navigationBarTitle("식당 추첨 결과")
    }
}