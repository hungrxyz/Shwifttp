//
//  HTTPHeaderKey.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPHeaderKey: Hashable {

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

}

public extension HTTPHeaderKey {

    static let authorization = HTTPHeaderKey("Authorization")

    static let contentType = HTTPHeaderKey("Content-Type")

    static let contentDisposition = HTTPHeaderKey("Content-Disposition")

}
