//
//  HTTPResponse.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPResponse {

    public let request: HTTPRequest
    private let response: HTTPURLResponse
    public let body: Data?

    public init(request: HTTPRequest, response: HTTPURLResponse, body: Data?) {
        self.request = request
        self.response = response
        self.body = body
    }

    public var status: HTTPStatus {
        HTTPStatus(rawValue: response.statusCode)
    }

    public var message: String {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }

    public var headers: [AnyHashable: Any] {
        response.allHeaderFields
    }

}
