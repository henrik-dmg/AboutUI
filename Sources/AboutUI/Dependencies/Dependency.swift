import Foundation
import SwiftUI

/// Represents the nature of a third-party dependency
public enum DependencyType: String, Identifiable {

    /// A Swift Package Manager dependency
    case spm
    /// A Carthage dependency
    case carthage
    /// A CocoaPods dependency
    case cocoapods
    /// A manually dependency
    case manual

    public var id: String {
        rawValue
    }

    public var name: LocalizedStringKey {
        switch self {
        case .spm:
            return "Swift Package Manager"
        case .carthage:
            return "Carthage"
        case .cocoapods:
            return "CocoaPods"
        case .manual:
            return "Manual"
        }
    }

}

/// A type representing a third-party dependency
public struct Dependency: Identifiable {

    let type: DependencyType
    let name: String
    let licenseFileURL: URL

    public var id: String {
        "\(type.rawValue) + \(name)"
    }

}

public extension Dependency {

    /// Creates a new SPM dependency
    /// - Parameters:
    ///   - name: the name of the dependency
    ///   - licenseFileURL: the URL where the license file of the dependency can be found
    /// - Returns: a new SPM dependency
    static func spm(name: String, licenseFileURL: URL) -> Dependency {
        Dependency(type: .spm, name: name, licenseFileURL: licenseFileURL)
    }

    /// Creates a new Carthage dependency
    /// - Parameters:
    ///   - name: the name of the dependency
    ///   - licenseFileURL: the URL where the license file of the dependency can be found
    /// - Returns: a new Carthage dependency
    static func carthage(name: String, licenseFileURL: URL) -> Dependency {
        Dependency(type: .carthage, name: name, licenseFileURL: licenseFileURL)
    }

    /// Creates a new CocoaPods dependency
    /// - Parameters:
    ///   - name: the name of the dependency
    ///   - licenseFileURL: the URL where the license file of the dependency can be found
    /// - Returns: a new CocoaPods dependency
    static func cocoapods(name: String, licenseFileURL: URL) -> Dependency {
        Dependency(type: .cocoapods, name: name, licenseFileURL: licenseFileURL)
    }

    /// Creates a new manual dependency
    /// - Parameters:
    ///   - name: the name of the dependency
    ///   - licenseFileURL: the URL where the license file of the dependency can be found
    /// - Returns: a new manual dependency
    static func manual(name: String, licenseFileURL: URL) -> Dependency {
        Dependency(type: .manual, name: name, licenseFileURL: licenseFileURL)
    }

}
