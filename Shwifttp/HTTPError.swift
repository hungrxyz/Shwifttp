//
//  HTTPError.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPError: Error {
    
    /// The high-level classification of this error
    public let reason: Reason

    /// The HTTPRequest that resulted in this error
    public let request: HTTPRequest

    /// Any HTTPResponse (partial or otherwise) that we might have
    public let response: HTTPResponse?

    /// If we have more information about the error that caused this, stash it here
    public let underlyingError: Error?

    public init(reason: Reason, request: HTTPRequest, response: HTTPResponse? = nil, underlyingError: Error? = nil) {
        self.reason = reason
        self.request = request
        self.response = response
        self.underlyingError = underlyingError
    }

    public var status: HTTPStatus? {
        response?.status
    }

}

public extension HTTPError {

    enum Reason {

        /// `HTTPRequest` could not be turned into a `URLRequest`
        case invalidRequest

        /// some sort of connectivity problem
        case cannotConnect

        /// HTTP response could not be determined
        case invalidResponse

        /// user cancelled the request
        case cancelled

        /// `URLError` occurred while connecting
        case urlError

        /// HTTP status code is outside of 2xx range
        case unsuccessfulStatus

        /// Some unknown error occured
        case unknown

        /// could be missing auth credentials, failing to retrieve credentials
        /// or something similar
        case invalidCredentials

    }

}
