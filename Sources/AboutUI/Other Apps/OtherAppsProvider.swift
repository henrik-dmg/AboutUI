import Foundation
import SwiftUI

/// A type that can retrieve other apps' metadata to showcase in the ``AboutHeaderSection``
public protocol OtherAppsProvider {

	/// Fetches the other apps' metadata and calls the completion handler with the appropriate result
	/// - Parameters:
	///   - result: the callback closure that will be called once the fetch operations has finished
	func retrieveOtherApps(result: @escaping (Result<[App], Error>) -> Void)

	/// Creates an image representation for the passed in app. This can be the app's icon or a promotional artwork, etc.
	/// - Parameters:
	///   - app: the app for which the image should be constructed
	/// - Returns: an optional `Image` instance
	func makeImageForApp(_ app: App) -> Image?

}

/// A type representing an application on the App Store or comparable app vendors
public struct App: Codable, Equatable, Hashable, Identifiable {

	/// The display name of the app
	public let name: String
	/// The unique identifier of the app
	public let id: String
	/// The URL where the app can be downloaded
	public let appStoreURL: URL
	/// An optional description of the app
	public let description: String?
	/// An optional URL of for example a remote image that represents tha app's icon
	public let imageURL: URL?

	/// Creates a new ``App`` instance
	/// - Parameters:
	///   - name: The display name of the app
	///   - id: The unique identifier of the app
	///   - appStoreURL: The URL where the app can be downloaded
	///   - description: An optional description of the app
	///   - imageURL: An optional URL of for example a remote image that represents tha app's icon
	public init(name: String, id: String, appStoreURL: URL, description: String? = nil, imageURL: URL? = nil) {
		self.name = name
		self.id = id
		self.appStoreURL = appStoreURL
		self.description = description
		self.imageURL = imageURL
	}

}
