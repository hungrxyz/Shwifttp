//
//  HTTPLoader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

// sourcery:spy
open class HTTPLoader {

    public var nextLoader: HTTPLoader? {
        willSet {
            guard nextLoader == nil else {
                fatalError("The nextLoader may only be set once")
            }
        }
    }

    public init() { }

    open func load(request: HTTPRequest) async throws -> HTTPResponse {
        guard let next = nextLoader else {
            throw HTTPError(reason: .cannotConnect, request: request)
        }
        return try await next.load(request: request)
    }

}
