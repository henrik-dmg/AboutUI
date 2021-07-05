import SwiftUI

public struct AboutFeedbackSection: View {

	let appName: String
	let appStoreURL: URL
	let contactEmailAddress: String

	public init(appName: String, appStoreURL: URL, contactEmailAddress: String) {
		self.appName = appName
		self.appStoreURL = appStoreURL
		self.contactEmailAddress = contactEmailAddress
	}

	public var body: some View {
		Section(header: Text("Feedback")) {
			Link(destination: URL(string: "mailto:\(contactEmailAddress)?subject=\(appName)%20Feedback")!) {
				Label("Send feedback", systemImage: "envelope")
			}
			Link(destination: appStoreURL) {
				Label("Rate \(appName) on the App Store", systemImage: "star")
			}
		}
	}

}
