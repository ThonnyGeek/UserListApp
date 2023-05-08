//
//  Optional+Extension.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation

public protocol OptionalProtocol {
    associatedtype Wrapped
    var _unbox: Optional<Wrapped> { get }
    init(nilLiteral: ())
    init(_ some: Wrapped)
}

extension Optional: OptionalProtocol {

    public var _unbox: Optional<Wrapped> {
        return self
    }
}
