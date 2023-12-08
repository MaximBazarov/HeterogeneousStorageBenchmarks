public protocol Storage {
    func get<T: Container>(_ type: T.Type) -> T
}

final class StorageSafeCasting: Storage {
    typealias Key = ObjectIdentifier

    private var _storage: [Key: Any] = [:]

    public func get<T: Container>(_ type: T.Type) -> T {
        let key = Key(type)
        if let value = _storage[key] {
            return value as! T
        }

        let value = type.init()
        _storage[key] = value
        return value
    }
}

final class StorageUnsafeCasting: Storage {
    typealias Key = ObjectIdentifier

    private var _storage: [Key: AnyObject] = [:]

    func get<T: Container>(_ type: T.Type) -> T {
        let key = Key(type)
        if let value = _storage[key] {
//            return value as! T
            return unsafeDowncast(value, to: T.self)
        }

        let value = type.init()
        _storage[key] = value
        return value
    }
}

public protocol Container: AnyObject {
    init()
}
