import SwiftUI

public struct AboutHeaderSection<Links: View>: View {

	let appName: String
	let headerSubtitle: String
	let appIcon: Image
	let copyrightName: String?
	let otherAppsProvider: OtherAppsProvider?
	let links: Links

	@Binding var openLinksInApp: Bool

	public init(
		appName: String,
		headerSubtitle: String,
		appIcon: Image,
		copyrightName: String? = nil,
		otherAppsProvider: OtherAppsProvider? = nil,
		openLinksInApp: Binding<Bool>,
		@ViewBuilder linksProvider: () -> Links
	) {
		self.appName = appName
		self.headerSubtitle = headerSubtitle
		self.appIcon = appIcon
		self.copyrightName = copyrightName
		self.otherAppsProvider = otherAppsProvider
		self._openLinksInApp = openLinksInApp
		self.links = linksProvider()
	}

	public var body: some View {
		Section {
			AboutHeaderView(appName: appName, subtitle: headerSubtitle, appIcon: appIcon)
			if let copyrightString = currentCopyrightYearString() {
				Text(copyrightString)
			}
			links
			if let provider = otherAppsProvider {
				NavigationLink("Other apps", destination: AboutOtherAppsView(provider: provider))
			}
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
