import SwiftUI

struct AboutHeaderView: View {

	let appName: String
	let subtitle: String?
	let appIcon: Image

	var body: some View {
		HStack(alignment: .center) {
			appIcon
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 65, alignment: .center)
				.cornerRadius(13, antialiased: true)
				.shadow(
					color: Color.black.opacity(0.3),
					radius: 4,
					x: 0,
					y: 4
				)
				.padding(.vertical, 4)
			VStack(alignment: .leading, spacing: 4) {
				Text(appName).font(.headline)
					.foregroundColor(.primary)
				if let subtitle = subtitle {
					Text(subtitle)
						.font(.subheadline)
						.foregroundColor(.secondary)
				}
				Text(currentVersionString())
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
		}
	}

	private func currentVersionString() -> String {
		"Version \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)"
	}

}

struct SettingsAboutHeaderView_Previews: PreviewProvider {

	static var previews: some View {
		NavigationView {
			List {
				Section {
					AboutHeaderView(appName: "URLy", subtitle: "Crafted with love in Berlin", appIcon: Image(systemName: "heart"))
				}
			}.navigationTitle("About")
		}
	}

}
