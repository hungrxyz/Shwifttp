//
//  DataBody.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct DataBody: HTTPBody {

    private let data: Data
    public var additionalHeaders: [HTTPHeaderKey: String]

    public init(_ data: Data, additionalHeaders: [HTTPHeaderKey: String] = [:]) {
        self.data = data
        self.additionalHeaders = additionalHeaders
    }

    public func encode() throws -> Data {
        data
    }

}
