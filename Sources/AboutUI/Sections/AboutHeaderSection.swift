import SwiftUI

/// A section dedicated to showcasing the current app, the app's creator and their (potentially) other created apps
public struct AboutHeaderSection<Links: View>: View {

	let appName: String
	let headerSubtitle: String
	let appIcon: Image
	let copyrightName: String?
	let links: Links

	/// Creates a section dedicated to showcasing the current app, the app's creator and their (potentially) other created apps
	/// - Parameters:
	///   - appName: The name of the app that is being showcased
	///   - headerSubtitle: The subtitle that will be displayed underneath the app's name
	///   - appIcon: The image that will be used to showcase the app. Typically the app's icon
	///   - copyrightName: The name of the copyright owner of the showcased app
	///   - linksProvider: A `ViewBuilder` closure that can be used to provide links or buttons such as the developer's Twitter handle for example, that will
	///   	be rendered below the showcased app's information and copyright information
	public init(
		appName: String,
		headerSubtitle: String,
		appIcon: Image,
		copyrightName: String? = nil,
		@ViewBuilder linksProvider: () -> Links
	) {
		self.appName = appName
		self.headerSubtitle = headerSubtitle
		self.appIcon = appIcon
		self.copyrightName = copyrightName
		self.links = linksProvider()
	}

	public var body: some View {
		Section {
			AboutHeaderView(appName: appName, subtitle: headerSubtitle, appIcon: appIcon)
			if let copyrightString = currentCopyrightYearString() {
				Text(copyrightString)
			}
			links
		}
	}

	private func currentCopyrightYearString() -> String? {
		guard let copyrightName = copyrightName else {
			return nil
		}
		let cal = Calendar.autoupdatingCurrent
		let year = cal.component(.year, from: Date())
		return "© \(year) \(copyrightName)"
	}

}
