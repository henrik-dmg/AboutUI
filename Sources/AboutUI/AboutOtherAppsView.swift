import SwiftUI

struct AboutOtherAppsView: View {

	var body: some View {
		List {
			Link(destination: URL(string: "https://apps.apple.com/us/app/hpweather/id1481728029")!) {
				buildLabel(name: "HPWeather")
			}
		}
	}

	@ViewBuilder private func buildLabel(name: String) -> some View {
		HStack {
			Image("AppIconSmall/\(name)")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 50, height: 50)
				.cornerRadius(10)
			Text(name).foregroundColor(.primary)
			Spacer()
			Image(systemName: "arrow.up.forward.app")
		}
	}

}

struct SettingsOtherAppsView_Previews: PreviewProvider {

	static var previews: some View {
		AboutOtherAppsView()
	}

}
