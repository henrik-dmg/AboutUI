import SwiftUI

public struct AboutLegalSection: View {

	let dependencies: [Dependency]
	@Binding var openLinksInApp: Bool

	public init(dependencies: [Dependency], openLinksInApp: Binding<Bool>) {
		self.dependencies = dependencies
		self._openLinksInApp = openLinksInApp
	}

	public init(openLinksInApp: Binding<Bool>, @DependencyBuilder dependencies: () -> [Dependency]) {
		self.init(dependencies: dependencies(), openLinksInApp: openLinksInApp)
	}

	public var body: some View {
		Section(header: Text("Legal")) {
			NavigationLink(
				"Third-Party Software",
				destination: AboutThirdPartyView(openLinksInApp: $openLinksInApp, dependencies: dependencies)
			)
			AdaptiveLink(
				"Privacy Policy",
				destination: URL(string: "https://panhans.dev/apps/songmatcher/privacy.html"),
				openLinksInApp: $openLinksInApp
			)
			AdaptiveLink(
				"Terms & Conditions",
				destination: URL(string: "https://panhans.dev/apps/songmatcher/terms.html"),
				openLinksInApp: $openLinksInApp
			)
		}
	}

}
