import SwiftUI

struct AboutOtherAppsView: View {

	let provider: OtherAppsProvider
	@State private var apps = [App]()
	@State private var error: Error?

	var body: some View {
		List {
			if let error = error {
				Section {
					Label(error.localizedDescription, systemImage: "exclamationmark.circle.fill").foregroundColor(.red)
				}
			}
			Section {
				ForEach(apps) { app in
					Link(destination: app.appStoreURL) {
						buildLabel(app: app)
					}
				}
			}
		}.onAppear {
			provider.retrieveOtherApps { result in
				switch result {
				case .success(let apps):
					self.apps = apps
				case .failure(let error):
					self.error = error
				}
			}
		}
	}

	@ViewBuilder private func buildLabel(app: App) -> some View {
		HStack {
			if let image = provider.makeImageForApp(app) {
				Label {
					Text(app.name).foregroundColor(.primary)
				} icon: {
					image
				}
			} else {
				Text(app.name).foregroundColor(.primary)
			}
//			Image("AppIconSmall/\(name)")
//				.resizable()
//				.aspectRatio(contentMode: .fit)
//				.frame(width: 50, height: 50)
//				.cornerRadius(10)

			Spacer()
			Image(systemName: "arrow.up.forward.app")
		}
	}

}

struct SettingsOtherAppsView_Previews: PreviewProvider {

	static var previews: some View {
		AboutOtherAppsView(
			provider: StaticAppsProvider(
				apps: [App(name: "SongMatcher", id: "asdjkalsdkja", appStoreURL: URL(string: "https://google.com")!)],
				imageProvider: nil
			)
		)
	}

}
