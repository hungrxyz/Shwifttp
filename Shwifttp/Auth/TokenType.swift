//
//  TokenType.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct TokenType: Hashable {

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

}

public extension TokenType {

    static let refresh = TokenType(rawValue: "refreshToken")

    static let access = TokenType(rawValue: "accessToken")

}
