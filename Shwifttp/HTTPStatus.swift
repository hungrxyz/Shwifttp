//
//  HTTPStatus.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

/// https://www.rfc-editor.org/rfc/rfc2616#section-10
public struct HTTPStatus: Hashable {

    public let rawValue: Int

}

public extension HTTPStatus {

    // MARK: - Informational 1xx
    // https://www.rfc-editor.org/rfc/rfc2616#section-10.1

    /// `100` Continue
    static let `continue` = HTTPStatus(rawValue: 100)

    /// `101` Switching Protocols
    static let switchingProtocols = HTTPStatus(rawValue: 101)

    // MARK: - Successful 2xx
    // https://www.rfc-editor.org/rfc/rfc2616#section-10.2

    /// `200` OK
    static let ok = HTTPStatus(rawValue: 200)

    /// `201` Created
    static let created = HTTPStatus(rawValue: 201)

    /// `202` Accepted
    static let accepted = HTTPStatus(rawValue: 202)

    /// `203` Non-Authoritative Information
    static let nonAuthoritativeInformation = HTTPStatus(rawValue: 203)

    /// `204` No Content
    static let noContent = HTTPStatus(rawValue: 204)

    /// `205` Reset Content
    static let resetContent = HTTPStatus(rawValue: 205)

    /// `206` Partial Content
    static let partialContent = HTTPStatus(rawValue: 206)

    // MARK: - Redirection 3xx
    // https://www.rfc-editor.org/rfc/rfc2616#section-10.3

    /// `300` Multiple Choices
    static let multipleChoices = HTTPStatus(rawValue: 300)

    /// `301` Moved Permanently
    static let movedPermanently = HTTPStatus(rawValue: 301)

    /// `302` Found
    static let found = HTTPStatus(rawValue: 302)

    /// `303` See Other
    static let seeOther = HTTPStatus(rawValue: 303)

    /// `304` Not Modified
    static let notModified = HTTPStatus(rawValue: 304)

    /// `305` Use Proxy
    static let useProxy = HTTPStatus(rawValue: 305)

    /// `306` (Unused)
    static let unused = HTTPStatus(rawValue: 306)

    /// `307` Temporary Redirect
    static let temporaryRedirect = HTTPStatus(rawValue: 307)

    // MARK: - Client Error 4xx
    // https://www.rfc-editor.org/rfc/rfc2616#section-10.4

    /// `400` Bad Request
    static let badRequest = HTTPStatus(rawValue: 400)

    /// `401` Unauthorized
    static let unauthorized = HTTPStatus(rawValue: 401)

    /// `402` Payment Required
    static let paymentRequired = HTTPStatus(rawValue: 402)

    /// `403` Forbidden
    static let forbidden = HTTPStatus(rawValue: 403)

    /// `404` Not Found
    static let notFound = HTTPStatus(rawValue: 404)

    /// `405` Method Not Allowed
    static let methodNotAllowed = HTTPStatus(rawValue: 405)

    /// `406` Not Acceptable
    static let notAcceptable = HTTPStatus(rawValue: 406)

    /// `407` Proxy Authentication Required
    static let proxyAuthenticationRequired = HTTPStatus(rawValue: 407)

    /// `408` Request Timeout
    static let requestTimeout = HTTPStatus(rawValue: 408)

    /// `409` Conflict
    static let conflict = HTTPStatus(rawValue: 409)

    /// `410` Gone
    static let gone = HTTPStatus(rawValue: 410)

    /// `411` Length Required
    static let lengthRequired = HTTPStatus(rawValue: 411)

    /// `412` Precondition Failed
    static let preconditionFailed = HTTPStatus(rawValue: 412)

    /// `413` Request Entity Too Large
    static let requestEntityTooLarge = HTTPStatus(rawValue: 413)

    /// `414` Request-URI Too Long
    static let requestURITooLong = HTTPStatus(rawValue: 414)

    /// `415` Unsupported Media Type
    static let unsupportedMediaType = HTTPStatus(rawValue: 415)

    /// `416` Requested Range Not Satisfiable
    static let requestedRangeNotSatisfiable = HTTPStatus(rawValue: 416)

    /// `417` Expectation Failed
    static let expectationFailed = HTTPStatus(rawValue: 417)

    // MARK: - Server Error 5xx
    // https://www.rfc-editor.org/rfc/rfc2616#section-10.5

    /// `500` Internal Server Error
    static let internalServerError = HTTPStatus(rawValue: 500)

    /// `501` Not Implemented
    static let notImplemented = HTTPStatus(rawValue: 501)

    /// `502` Bad Gateway
    static let badGateway = HTTPStatus(rawValue: 502)

    /// `503` Service Unavailable
    static let serviceUnavailable = HTTPStatus(rawValue: 503)

    /// `504` Gateway Timeout
    static let gatewayTimeout = HTTPStatus(rawValue: 504)

    /// `505` HTTP Version Not Supported
    static let httpVersionNotSupported = HTTPStatus(rawValue: 505)

}
