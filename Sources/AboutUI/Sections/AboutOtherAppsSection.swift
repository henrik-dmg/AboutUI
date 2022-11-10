import SwiftUI

public struct AboutOtherAppsSection<Provider: OtherAppsProvider, Icon: View>: View {
    
    @ObservedObject var provider: Provider
    private let iconProvider: (App) -> Icon
    
    public init(provider: Provider, @ViewBuilder iconProvider: @escaping (App) -> Icon) {
        self.provider = provider
        self.iconProvider = iconProvider
    }
    
    public var body: some View {
        content.task {
            provider.retrieveOtherApps()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch provider.state {
        case .idle:
            Text("No other apps")
        case .loading(let cachedApps):
            if let cachedApps = cachedApps {
                navigationLink(to: cachedApps)
            } else {
                Label {
                    Text("Fetching other apps")
                } icon: {
                    ProgressView()
                }
            }
        case .success(let apps):
            navigationLink(to: apps)
        case .failure(let error as NSError):
#if DEBUG
            Text(error.description).foregroundColor(.red)
            Text("You will only see this error text for debug builds")
#else
            EmptyView()
#endif
        }
    }
    
    @ViewBuilder private func navigationLink(to apps: [App]) -> some View {
        NavigationLink("Other apps") {
            AboutOtherAppsView(apps: apps, imageConstructor: iconProvider)
        }
    }
    
}
