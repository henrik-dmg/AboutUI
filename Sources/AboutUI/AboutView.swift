import SwiftUI

struct AboutView: View {

	let appName: String

	@Binding var openLinksInApp: Bool
	@Binding var tintColor: Color

	var body: some View {
		List {
			Section {
				AboutHeaderView()
			}
			Section(header: Text("Other apps")) {
				NavigationLink("Other apps", destination: AboutOtherAppsView())
			}
			Section(header: Text("Legal")) {
				NavigationLink("Third-Party Software", destination: AboutThirdPartyView(openLinksInApp: $openLinksInApp, dependencies: []))
				AdaptiveLink("Privacy Policy", destination: URL(string: "https://panhans.dev/apps/songmatcher/privacy.html"), openLinksInApp: $openLinksInApp)
				AdaptiveLink("Terms & Conditions", destination: URL(string: "https://panhans.dev/apps/songmatcher/terms.html"), openLinksInApp: $openLinksInApp)
			}
			Section(header: Text("Feedback")) {
				Link(destination: URL(string: "mailto:henrik@panhans.dev?subject=SongMatcher%20Feedback")!) {
					Label("Give feedback", systemImage: "envelope")
				}
				Link(destination: URL(string: "https://apps.apple.com/us/app/songmatcher/id1530801339")!) {
					Label("Rate URLy on the App Store", systemImage: "star")
				}
			}
		}.navigationTitle("About \(appName)").accentColor(tintColor)
	}

}

struct SettingsAboutView_Previews: PreviewProvider {

	static var previews: some View {
		AboutView(appName: "SongMatcher", openLinksInApp: .constant(false), tintColor: .constant(.red))
	}

}

