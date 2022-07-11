import SwiftUI

struct AboutOtherAppsView<Icon: View>: View {

	let apps: [App]
	let imageConstructor: (App) -> Icon?

	init(apps: [App], imageConstructor: @escaping (App) -> Icon?) {
		self.apps = apps.filter { $0.appStoreURL != nil }
		self.imageConstructor = imageConstructor
	}

	var body: some View {
		List(apps) { app in
			Link(destination: app.appStoreURL!) {
				buildLabel(app: app)
			}
		}
	}

	@ViewBuilder private func buildLabel(app: App) -> some View {
		HStack {
			if let image = imageConstructor(app) {
				HStack {
					image
					Text(app.name).foregroundColor(.primary)
				}
			} else {
				Text(app.name).foregroundColor(.primary)
			}
			Spacer()
			Image(systemName: "arrow.up.forward.app")
		}
	}

}
