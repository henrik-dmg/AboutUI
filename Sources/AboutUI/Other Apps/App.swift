import Foundation

/// A type representing an application on the App Store or comparable app vendors
public struct App: Codable, Equatable, Hashable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case name
        case id
        case appStoreURL
        case description
        case iconURL
        case isLive
    }

    /// The display name of the app
    public let name: String
    /// The unique identifier of the app
    public let id: String
    /// The URL where the app can be downloaded
    public let appStoreURL: URL?
    /// An optional description of the app
    public let description: String?
    /// An optional URL of for example a remote image that represents tha app's icon
    public let iconURL: URL?
    /// Boolean indicating wether the app is live on the App Store or not
    public let isLive: Bool

    /// Creates a new ``App`` instance
    /// - Parameters:
    ///   - name: The display name of the app
    ///   - id: The unique identifier of the app
    ///   - appStoreURL: The URL where the app can be downloaded
    ///   - description: An optional description of the app
    ///   - imageURL: An optional URL of for example a remote image that represents tha app's icon
    public init(name: String, id: String, appStoreURL: URL, description: String? = nil, iconURL: URL? = nil, isLive: Bool = true) {
        self.name = name
        self.id = id
        self.appStoreURL = appStoreURL
        self.description = description
        self.iconURL = iconURL
        self.isLive = isLive
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
        appStoreURL = try container.decodeIfPresent(URL.self, forKey: .appStoreURL)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        iconURL = try container.decodeIfPresent(URL.self, forKey: .iconURL)
        isLive = try container.decodeIfPresent(Bool.self, forKey: .isLive) ?? true
    }

}
