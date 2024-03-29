import SwiftUI

struct AboutThirdPartyView: View {
    
    @Binding var openLinksInApp: Bool
    let tintColor: Color
    let sections: [Section]
    
    init(openLinksInApp: Binding<Bool>, tintColor: Color, dependencies: [Dependency]) {
        self._openLinksInApp = openLinksInApp
        self.tintColor = tintColor
        
        let dictionary = Dictionary(grouping: dependencies, by: { $0.type })
        self.sections = dictionary.map { Section(title: $0.key.name, dependencies: $0.value) }
    }
    
    init(openLinksInApp: Binding<Bool>, tintColor: Color, @DependencyBuilder dependencies: () -> [Dependency]) {
        self.init(openLinksInApp: openLinksInApp, tintColor: tintColor, dependencies: dependencies())
    }
    
    var body: some View {
        List {
            ForEach(sections) { section in
                SwiftUI.Section(section.title) {
                    ForEach(section.dependencies) { dependency in
                        HStack {
                            AdaptiveLink(destination: dependency.licenseFileURL, openLinksInApp: $openLinksInApp) {
                                Text(dependency.name)
                            }
                            Spacer()
                        }.contentShape(Rectangle())
                    }
                }
            }
        }
        .accentColor(tintColor)
        .navigationTitle("Third-Party Software")
    }
    
}

extension AboutThirdPartyView {
    
    struct Section: Identifiable {
        let title: LocalizedStringKey
        let dependencies: [Dependency]
        
        var id: String {
            "\(title)"
        }
    }
    
}

struct AboutThirdPartyView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutThirdPartyView(openLinksInApp: .constant(true), tintColor: .red) {
            Dependency.spm(name: "Mixpanel", licenseFileURL: URL(string: "https://google.com")!)
            Dependency.carthage(name: "Mixpanel", licenseFileURL: URL(string: "https://google.com")!)
            Dependency.spm(name: "FloatingPanel", licenseFileURL: URL(string: "https://google.com")!)
        }
    }
    
}
