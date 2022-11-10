import Foundation

/// A result builder that can be utilised to define a list of dependencies in a SwiftUI-like way
@resultBuilder public struct DependencyBuilder {

    public static func buildBlock(_ components: Dependency...) -> [Dependency] {
        components
    }

    public static func buildEither(first component: [Dependency]) -> [Dependency] {
        component
    }

    public static func buildEither(second component: [Dependency]) -> [Dependency] {
        component
    }

    public static func buildOptional(_ component: [Dependency]?) -> [Dependency] {
        component ?? []
    }

}
