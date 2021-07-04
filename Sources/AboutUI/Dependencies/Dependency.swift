import Foundation

enum DependencyType: String, Identifiable {

	case spm, carthage, cocoapods, manual

	var id: String {
		rawValue
	}

}

public struct Dependency: Identifiable {

	let type: DependencyType
	let name: String
	let licenseFileURL: URL

	public var id: String {
		"\(type.rawValue) + \(name)"
	}

}

public extension Dependency {

	static func spm(name: String, licenseFileURL: URL) -> Dependency {
		Dependency(type: .spm, name: name, licenseFileURL: licenseFileURL)
	}

	static func carthage(name: String, licenseFileURL: URL) -> Dependency {
		Dependency(type: .carthage, name: name, licenseFileURL: licenseFileURL)
	}

	static func cocoapods(name: String, licenseFileURL: URL) -> Dependency {
		Dependency(type: .cocoapods, name: name, licenseFileURL: licenseFileURL)
	}

	static func manual(name: String, licenseFileURL: URL) -> Dependency {
		Dependency(type: .manual, name: name, licenseFileURL: licenseFileURL)
	}

}
