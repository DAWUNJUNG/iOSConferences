//
// Created by LACY on 2021/06/11.
//

import SwiftUI

struct shop_details_all: View {
    @Binding var menu_arr: Array<String>
    @Binding var shop_name: String

    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(shop_name)
            }
            ForEach(menu_arr, id: \.self) { menu_name in
                Text(menu_name)
            }
        }.navigationBarTitle("식당 추첨 결과")
    }
}