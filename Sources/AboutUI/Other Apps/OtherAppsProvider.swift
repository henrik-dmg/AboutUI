import Foundation
import SwiftUI

public protocol OtherAppsProvider {

	func retrieveOtherApps(result: @escaping (Result<[App], Error>) -> Void)
	func makeImageForApp(_ app: App) -> Image?

}

public struct App: Codable, Equatable, Hashable, Identifiable {

	public let name: String
	public let id: String
	public let appStoreURL: URL
	public let description: String?
	public let imageURL: URL?

	public init(name: String, id: String, appStoreURL: URL, description: String? = nil, imageURL: URL? = nil) {
		self.name = name
		self.id = id
		self.appStoreURL = appStoreURL
		self.description = description
		self.imageURL = imageURL
	}

}
