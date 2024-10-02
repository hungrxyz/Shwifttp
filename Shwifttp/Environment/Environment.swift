//
//  Environment.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct Environment: Hashable, Equatable, HTTPRequestOption {

    public static let defaultOptionValue: Environment? = nil

    public var host: String
    public var pathPrefix: String
    public var headers: [HTTPHeaderKey: String]
    public var query: [URLQueryItem]

    public init(host: String, pathPrefix: String = "/", headers: [HTTPHeaderKey: String] = [:], query: [URLQueryItem] = []) {
        self.host = host
        self.pathPrefix = pathPrefix
        self.headers = headers
        self.query = query
    }

}

