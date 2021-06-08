//
//  ContentView.swift
//  iOSConferences
//
//  Created by LACY on 2021/06/07.
//
//

import SwiftUI

struct ConferenceList: View {
    var body: some View {
        TabView {
            NavigationView {
                List(conferencesData) { conference in
                    NavigationLink(destination: ConferenceDetails(conference: conference)) {
                        VStack(alignment: .leading) {
                            Text(conference.name).font(.headline)
                            Text(conference.location).font(.subheadline)
                        }
                    }
                }.navigationBarTitle("메뉴 추첨")
            }.tabItem {
                Image(systemName: "filemenu.and.selection")
                Text("메뉴")
            }
            NavigationView {
                List(conferencesData) { conference in
                    NavigationLink(destination: ConferenceDetails(conference: conference)) {
                        VStack(alignment: .leading) {
                            Text(conference.name).font(.headline)
                            Text(conference.location).font(.subheadline)
                        }
                    }
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
