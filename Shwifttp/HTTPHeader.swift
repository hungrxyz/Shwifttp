//
//  HTTPHeader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPHeader: Hashable {

    public let key: HTTPHeaderKey
    public let value: String

    public init(key: HTTPHeaderKey, value: String) {
        self.key = key
        self.value = value
    }

}
