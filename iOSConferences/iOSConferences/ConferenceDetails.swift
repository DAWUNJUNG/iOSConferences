import SwiftUI

struct ConferenceDetails: View {
    var conference: Conference
    var body: some View {
        VStack {
            Text(conference.location)
            Text(conference.textDates())
            LinkButton(link: conference.link)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .navigationBarTitle(conference.name)
    }
}

struct LinkButton: View {
    var link = ""
    var body: some View {
        Button(action: {
            UIApplication.shared.open(URL(string: self.link)!)
        }) {
            Text("Go to official website")
        }
    }
}

class ConferenceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceDetails(conference: Conference())
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ConferenceDetails(conference: Conference()))
    }
    #endif
}
