import SwiftUI

struct AboutHeaderView: View {

	var body: some View {
		HStack(alignment: .center) {
			Image(getCurrentAppIconName())
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 65, alignment: .center)
				.cornerRadius(10)
				.shadow(
					color: Color.black.opacity(0.3),
					radius: 4,
					x: 0,
					y: 4
				)
				.padding(.vertical, 4)
			VStack(alignment: .leading, spacing: 4) {
				Text("URLy").font(.headline)
					.foregroundColor(.primary)
				Text("Crafted with love in beautiful Berlin")
					.font(.subheadline)
					.foregroundColor(.secondary)
				Text(currentVersionString())
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
		}
		.contextMenu(menuItems: {
//			Link(destination: ButtonViewModel.email.link) {
//				Label("Email me", systemImage: "envelope")
//			}
//			Link(destination: ButtonViewModel.twitter.link) {
//				Label("Twitter", image: "Twitter Logo")
//			}
//			Link(destination: ButtonViewModel.website.link) {
//				Label("Website", systemImage: "network")
//			}
//			Link(destination: ButtonViewModel.github.link) {
//				Label("Github", image: "Github Logo")
//			}
		})
	}

	private func currentCopyrightYearString() -> String {
		let cal = Calendar.autoupdatingCurrent
		let year = cal.component(.year, from: Date())
		return year == 2021
			? "© Henrik Panhans 2021"
			: "© Henrik Panhans 2021 - \(year)"
	}

	private func currentVersionString() -> String {
		"Version \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)"
	}

	private func getCurrentAppIconName() -> String {
		#if os(iOS)
		guard let alternateIcon = UIApplication.shared.alternateIconName else {
			return "AppIconSmall/Default"
		}
		return "AppIconSmall/\(alternateIcon)"
		#else
		return "AppIconSmall/Default"
		#endif
	}

}

struct SettingsAboutHeaderView_Previews: PreviewProvider {

	static var previews: some View {
		NavigationView {
			List {
				Section {
					AboutHeaderView()
				}
			}.navigationTitle("About")
		}
	}

}
