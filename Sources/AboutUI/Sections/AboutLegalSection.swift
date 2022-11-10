import SwiftUI

/// A section dedicated to providing the user with legal information such as a link to the privacy policy of the app or the T&C
public struct AboutLegalSection: View {
    
    let dependencies: [Dependency]
    let privacyPolicyURL: URL?
    let termsAndConditionsURL: URL?
    let tintColor: Color
    @Binding var openLinksInApp: Bool
    
    /// Creates a section dedicated to providing the user with legal information such as a link to the privacy policy of the app or the T&C
    /// - Parameters:
    ///   - dependencies: The third-party dependencies used by the app
    ///   - privacyPolicyURL: The URL where the privacy policy of your app can be found
    ///   - termsAndConditionsURL: The URL where the terms and conditions of your app can be found
    ///   - openLinksInApp: A boolean controlling whether clicked links should be opened in an in-app Safari window or be forwarded to the user's default browser
    ///   - tintColor: The tint color of provided the links
    public init(dependencies: [Dependency], privacyPolicyURL: URL?, termsAndConditionsURL: URL?, openLinksInApp: Binding<Bool>, tintColor: Color) {
        self.dependencies = dependencies
        self.privacyPolicyURL = privacyPolicyURL
        self.termsAndConditionsURL = termsAndConditionsURL
        self._openLinksInApp = openLinksInApp
        self.tintColor = tintColor
    }
    
    /// Creates a section dedicated to providing the user with legal information such as a link to the privacy policy of the app or the T&C
    /// - Parameters:
    ///   - privacyPolicyURL: The URL where the privacy policy of your app can be found
    ///   - termsAndConditionsURL: The URL where the terms and conditions of your app can be found
    ///   - openLinksInApp: A boolean controlling whether clicked links should be opened in an in-app Safari window or be forwarded to the user's default browser
    ///   - tintColor: The tint color of provided the links
    ///   - dependencies: A closure that can be used to provider information about used third-party dependencies in a SwiftUI-like style
    public init(
        privacyPolicyURL: URL?,
        termsAndConditionsURL: URL?,
        openLinksInApp: Binding<Bool>,
        tintColor: Color,
        @DependencyBuilder dependencies: () -> [Dependency]
    ) {
        self.init(dependencies: dependencies(), privacyPolicyURL: privacyPolicyURL, termsAndConditionsURL: termsAndConditionsURL, openLinksInApp: openLinksInApp, tintColor: tintColor)
    }
    
    public var body: some View {
        Section(header: Text("Legal")) {
            NavigationLink(
                "Third-Party Software",
                destination: AboutThirdPartyView(openLinksInApp: $openLinksInApp, tintColor: tintColor, dependencies: dependencies)
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
