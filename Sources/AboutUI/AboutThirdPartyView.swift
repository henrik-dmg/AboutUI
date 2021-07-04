import SwiftUI

struct AboutThirdPartyView: View {

	@Binding var openLinksInApp: Bool
	let sections: [Section]

	init(openLinksInApp: Binding<Bool>, dependencies: [Dependency]) {
		self._openLinksInApp = openLinksInApp

		let dictionary = Dictionary(grouping: dependencies, by: { $0.type })
		self.sections = dictionary.map { Section(title: $0.key.rawValue, dependencies: $0.value) }
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
		}.navigationTitle("Third-Party Software")
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