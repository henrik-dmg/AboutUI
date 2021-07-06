import SwiftUI

struct AboutThirdPartyView: View {

	@Binding var openLinksInApp: Bool
	@Binding var tintColor: Color
	let sections: [Section]

	init(openLinksInApp: Binding<Bool>, tintColor: Binding<Color>, dependencies: [Dependency]) {
		self._openLinksInApp = openLinksInApp
		self._tintColor = tintColor

		let dictionary = Dictionary(grouping: dependencies, by: { $0.type })
		self.sections = dictionary.map { Section(title: $0.key.rawValue, dependencies: $0.value) }
	}

	init(openLinksInApp: Binding<Bool>, tintColor: Binding<Color>, @DependencyBuilder dependencies: () -> [Dependency]) {
		self.init(openLinksInApp: openLinksInApp, tintColor: tintColor, dependencies: dependencies())
	}

	var body: some View {
		List {
			ForEach(sections) { section in
				SwiftUI.Section(header: Text(section.title)) {
					ForEach(section.dependencies) { dependency in
						AdaptiveLink(dependency.name, destination: dependency.licenseFileURL, openLinksInApp: $openLinksInApp)
					}
				}
			}
		}.accentColor(tintColor).navigationTitle("Third-Party Software")
	}

}

extension AboutThirdPartyView {

	struct Section: Identifiable {
		let title: String
		let dependencies: [Dependency]

		var id: String {
			title
		}
	}

}

struct AboutThirdPartyView_Previews: PreviewProvider {

	static var previews: some View {
		AboutThirdPartyView(openLinksInApp: .constant(true), tintColor: .constant(.red)) {
			Dependency.spm(name: "Mixpanel", licenseFileURL: URL(string: "https://google.com")!)
			Dependency.carthage(name: "Mixpanel", licenseFileURL: URL(string: "https://google.com")!)
			Dependency.spm(name: "FloatingPanel", licenseFileURL: URL(string: "https://google.com")!)
		}.listStyle(InsetGroupedListStyle())
	}

}
