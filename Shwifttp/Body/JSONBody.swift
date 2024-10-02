//
//  JSONBody.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct JSONBody: HTTPBody {

    public var additionalHeaders: [HTTPHeaderKey : String] = [
        .contentType: "application/json; charset=utf-8"
    ]

    private let _encode: () throws -> Data

    public init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self._encode = {
            try encoder.encode(value)
        }
    }

    public func encode() throws -> Data {
        return try _encode()
    }

}
