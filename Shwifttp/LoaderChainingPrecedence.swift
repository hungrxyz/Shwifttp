//
//  LoaderChainingPrecedence.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

precedencegroup LoaderChainingPrecedence {
    higherThan: NilCoalescingPrecedence
    associativity: right
}

infix operator --> : LoaderChainingPrecedence

@discardableResult
public func --> (lhs: HTTPLoader?, rhs: HTTPLoader?) -> HTTPLoader? {
    lhs?.nextLoader = rhs
    return lhs ?? rhs
}

@discardableResult
public func --> (lhs: HTTPLoader, rhs: HTTPLoader?) -> HTTPLoader {
    lhs.nextLoader = rhs
    return lhs
}

@discardableResult
public func --> (lhs: HTTPLoader, rhs: HTTPLoader) -> HTTPLoader {
    lhs.nextLoader = rhs
    return lhs
}
