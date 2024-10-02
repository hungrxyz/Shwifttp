//
//  BasicCredentials.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct BasicCredentials: Hashable, Equatable {

    public let username: String
    public let password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

}

extension BasicCredentials: HTTPRequestOption {

    public static let defaultOptionValue: BasicCredentials? = nil

}
