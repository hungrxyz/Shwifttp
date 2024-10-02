//
//  BasicAuthLoader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public protocol BasicAuthSource: AnyObject {

    func credentials() async throws -> BasicCredentials

}

open class BasicAuthLoader: HTTPLoader {

    public weak var source: BasicAuthSource?

    open override func load(request: HTTPRequest) async throws -> HTTPResponse {

        if let credentials = request.basicCredentials {
            let newRequest = apply(credentials, to: request)

            return try await super.load(request: newRequest)
        } else if let credentials = try await source?.credentials() {
            let newRequest = apply(credentials, to: request)

            return try await super.load(request: newRequest)
        } else {
            // assume no basic credentials
            return try await super.load(request: request)
        }

    }

}

private extension BasicAuthLoader {

    func apply(_ credentials: BasicCredentials, to request: HTTPRequest) -> HTTPRequest {
        var requestCopy = request

        let joined = [credentials.username, credentials.password].joined(separator: ":")
        let data = Data(joined.utf8)
        let encoded = data.base64EncodedString()
        let header = ["Basic", encoded].joined(separator: " ")

        requestCopy.headers[.authorization] = header

        return requestCopy
    }

}
