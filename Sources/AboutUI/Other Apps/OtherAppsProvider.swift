import Foundation
import SwiftUI

/// A type that can retrieve other apps' metadata to showcase in the ``AboutHeaderSection``
public protocol OtherAppsProvider: ObservableObject {

	var state: LoadingState<[App]> { get }

	/// Fetches the other apps' metadata and calls the completion handler with the appropriate result
	/// - Parameters:
	///   - result: the callback closure that will be called once the fetch operations has finished
	func retrieveOtherApps()

}
