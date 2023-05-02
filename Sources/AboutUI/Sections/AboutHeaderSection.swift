import SwiftUI

/// A section dedicated to showcasing the current app, the app's creator and their (potentially) other created apps
public struct AboutHeaderSection<Links: View>: View {
    
    let appName: LocalizedStringKey
    let headerSubtitle: LocalizedStringKey
    let appIcon: Image
    let copyright: String?
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
        appName: LocalizedStringKey,
        headerSubtitle: LocalizedStringKey,
        appIcon: Image,
        copyright: String? = nil,
        @ViewBuilder linksProvider: () -> Links
    ) {
        self.appName = appName
        self.headerSubtitle = headerSubtitle
        self.appIcon = appIcon
        self.copyright = copyright
        self.links = linksProvider()
    }
    
    public var body: some View {
        Section {
            AboutHeaderView(appName: appName, subtitle: headerSubtitle, appIcon: appIcon)
            if let copyright {
                Text(copyright)
            }
            links
        }
    }
    
}
