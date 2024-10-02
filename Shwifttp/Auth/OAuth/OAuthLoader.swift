//
//  OAuthLoader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

open class OAuthLoader: HTTPLoader {

    public var credentialsKeeper: OAuthCredentialsKeeper?
    public var credentialsRefresher: OAuthCredentialsRefresher?

    open override func load(request: HTTPRequest) async throws -> HTTPResponse {

        // Check for valid access token first.
        if let accessToken = try? await credentialsKeeper?.accessToken(), accessToken.isExpired == false {
            let modifiedRequest = applyHeader(accessToken: accessToken, to: request)

            return try await super.load(request: modifiedRequest)

        // Check for refresh token and refresh credentials.
        } else if let refreshToken = try? await credentialsKeeper?.refreshToken() {
            guard
                let newCredentials = try await credentialsRefresher?.refresh(using: refreshToken),
                let accessToken = newCredentials.accessToken
            else {
                throw HTTPError(reason: .invalidCredentials, request: request)
            }
            
            // Forward new credentials to whoever is concerned with keeping them.
            credentialsKeeper?.keep(credentials: newCredentials)

            let modifiedRequest = applyHeader(accessToken: accessToken, to: request)

            return try await super.load(request: modifiedRequest)

        // Something is really wrong, there should be credentials already.
        } else {
            throw HTTPError(reason: .invalidCredentials, request: request)
        }
    }

}

private extension OAuthLoader {

    func applyHeader(accessToken: OAuthToken, to request: HTTPRequest) -> HTTPRequest {
        var requestCopy = request

        let headerValue = ["Bearer", accessToken.value].joined(separator: " ")
        requestCopy.headers[.authorization] = headerValue

        return requestCopy
    }

}
