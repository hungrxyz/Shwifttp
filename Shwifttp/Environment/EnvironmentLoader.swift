//
//  EnvironmentLoader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

open class EnvironmentLoader: HTTPLoader {

    public let environment: Environment

    public init(environment: Environment) {
        self.environment = environment
        super.init()
    }

    public override func load(request: HTTPRequest) async throws -> HTTPResponse {
        var requestCopy = request

        requestCopy.host = environment.host

        if environment.pathPrefix != "/" {
            requestCopy.path = environment.pathPrefix + request.path
        }

        if environment.headers.isEmpty == false {
            var headers = request.headers
            let headersToAdd = environment.headers.filter { headers.keys.contains($0.key) == false }

            for header in headersToAdd {
                headers[header.key] = header.value
            }

            requestCopy.headers = headers
        }

        if environment.query.isEmpty == false {
            var queryItems = request.queryItems
            queryItems.append(contentsOf: environment.query)

            requestCopy.queryItems = queryItems
        }

        return try await super.load(request: requestCopy)
    }

}
