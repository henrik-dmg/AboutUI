import SwiftUI

/// A section dedicated to providing feedback opportunities for an app
public struct AboutFeedbackSection: View {
    
    let appName: String
    let appStoreURL: URL
    let contactEmailAddress: String
    
    /// Creates a section that is dedicated to providing feedback opportunities for an app
    /// - Parameters:
    ///   - appName: The name of the app that the potential feedback is about
    ///   - appStoreURL: The URL where the app can be downloaded or publicly reviewed. Typically the App Store link
    ///   - contactEmailAddress: The email address that will be used when the user wants to give email feedback
    public init(appName: String, appStoreURL: URL, contactEmailAddress: String) {
        self.appName = appName
        self.appStoreURL = appStoreURL
        self.contactEmailAddress = contactEmailAddress
    }
    
    public var body: some View {
        Section.init(header: Text("Feedback")) {
            Link(destination: URL(string: "mailto:\(contactEmailAddress)?subject=\(appName)%20Feedback")!) {
                Label("Send feedback", systemImage: "envelope")
            }
            Link(destination: appStoreURL) {
                Label("Rate \(appName) on the App Store", systemImage: "star")
            }
        }
    }
    
}
