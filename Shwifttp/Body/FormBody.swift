//
//  FormBody.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct FormBody: HTTPBody {

    public enum EncodingError: Error {
        case invalidValues
    }

    public var additionalHeaders: [HTTPHeaderKey : String] = [
        .contentType: "application/x-www-form-urlencoded; charset=utf-8"
    ]

    private let values: [URLQueryItem]

    public init(_ values: [URLQueryItem]) {
        self.values = values
    }

    public init(_ values: [String: String]) {
        let queryItems = values.map { URLQueryItem(name: $0.key, value: $0.value) }
        self.init(queryItems)
    }

    public func encode() throws -> Data {
        var components = URLComponents()
        components.queryItems = values

        guard let query = components.query else {
            throw EncodingError.invalidValues
        }

        return Data(query.utf8)
    }

}
