import Foundation
import SwiftUI

/// A type that can be used to provide static/offline app metadata to ``AboutHeaderSection``
public class StaticAppsProvider: OtherAppsProvider {
    
    @Published public var state: LoadingState<[App]>
    let imageProvider: ((App) -> Image?)?
    
    /// Creates a new instance of ``StaticAppsProvider``
    /// - Parameters:
    ///   - apps: an array of apps that the provider will forward to ``AboutHeaderSection``
    ///   - imageProvider: an optional image builder closure that will be called when the provider is asked for an image for an app
    public init(apps: [App], imageProvider: ((App) -> Image?)?) {
        self._state = .init(initialValue: .success(apps))
        self.imageProvider = imageProvider
    }
    
    public func retrieveOtherApps() {
        // do nothing as we don't provide dynamic apps
    }
    
}
