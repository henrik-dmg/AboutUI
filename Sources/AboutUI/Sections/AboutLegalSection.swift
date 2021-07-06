import SwiftUI

public struct AboutLegalSection: View {

	let dependencies: [Dependency]
	let privacyPolicyURL: URL?
	let termsAndConditionsURL: URL?
	@Binding var openLinksInApp: Bool
	@Binding var tintColor: Color

	public init(dependencies: [Dependency], privacyPolicyURL: URL?, termsAndConditionsURL: URL?, openLinksInApp: Binding<Bool>, tintColor: Binding<Color>) {
		self.dependencies = dependencies
		self.privacyPolicyURL = privacyPolicyURL
		self.termsAndConditionsURL = termsAndConditionsURL
		self._openLinksInApp = openLinksInApp
		self._tintColor = tintColor
	}

	public init(privacyPolicyURL: URL?, termsAndConditionsURL: URL?, openLinksInApp: Binding<Bool>, tintColor: Binding<Color>, @DependencyBuilder dependencies: () -> [Dependency]) {
		self.init(dependencies: dependencies(), privacyPolicyURL: privacyPolicyURL, termsAndConditionsURL: termsAndConditionsURL, openLinksInApp: openLinksInApp, tintColor: tintColor)
	}

	public var body: some View {
		Section(header: Text("Legal")) {
			NavigationLink(
				"Third-Party Software",
				destination: AboutThirdPartyView(openLinksInApp: $openLinksInApp, tintColor: $tintColor, dependencies: dependencies)
			)
			AdaptiveLink(
				"Privacy Policy",
				destination: privacyPolicyURL,
				openLinksInApp: $openLinksInApp
			)
			AdaptiveLink(
				"Terms & Conditions",
				destination: termsAndConditionsURL,
				openLinksInApp: $openLinksInApp
			)
		}
	}

}
