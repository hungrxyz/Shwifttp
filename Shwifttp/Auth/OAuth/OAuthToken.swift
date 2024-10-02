//
//  OAuthToken.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct OAuthToken: Hashable {

    public let value: String
    public let type: TokenType
    public let expiration: Date?

    public init(value: String, type: TokenType, expiration: Date?) {
        self.value = value
        self.type = type
        self.expiration = expiration
    }

    public var isExpired: Bool {
        guard let expiration else {
            return false
        }
        return Date() > expiration
    }

}
