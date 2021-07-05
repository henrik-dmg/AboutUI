import Foundation
import SwiftUI

public struct StaticAppsProvider: OtherAppsProvider {

	let apps: [App]
	let imageProvider: ((App) -> Image?)?

	public init(apps: [App], imageProvider: ((App) -> Image?)?) {
		self.apps = apps
		self.imageProvider = imageProvider
	}

	public func retrieveOtherApps(result: @escaping (Result<[App], Error>) -> Void) {
		result(.success(apps))
	}

	public func makeImageForApp(_ app: App) -> Image? {
		imageProvider?(app)
	}

}
