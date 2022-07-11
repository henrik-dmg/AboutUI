import Foundation

public enum LoadingState<T> {
	case idle
	case loading(T?)
	case success(T)
	case failure(Error)

	public var value: T? {
		switch self {
		case .success(let value):
			return value
		case .loading(let value):
			return value
		default:
			return nil
		}
	}
}
