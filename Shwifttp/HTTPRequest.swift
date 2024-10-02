//
//  HTTPRequest.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPRequest {

    private var urlComponents = URLComponents()

    private var options: [ObjectIdentifier: AnyHashable] = [:]

    public var method: HTTPMethod = .get

    public var headers: [HTTPHeaderKey: String] = [:]

    public var body: HTTPBody?

    public init() {
        urlComponents.scheme = "https"
    }

    public init?(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents = components
    }

}

public extension HTTPRequest {

    var scheme: String {
        get { urlComponents.scheme ?? "https" }
        set { urlComponents.scheme = newValue }
    }

    var host: String? {
        get { urlComponents.host }
        set { urlComponents.host = newValue }
    }

    var path: String {
        get { urlComponents.path }
        set {
            if newValue.hasPrefix("/") {
                urlComponents.path = newValue
            } else {
                urlComponents.path = "/" + newValue
            }
        }
    }

    var queryItems: [URLQueryItem] {
        get { urlComponents.queryItems ?? [] }
        set { urlComponents.queryItems = newValue }
    }

    var url: URL? {
        urlComponents.url
    }

    var serverEnvironment: Environment? {
        get { self[option: Environment.self] }
        set { self[option: Environment.self] = newValue }
    }

    var basicCredentials: BasicCredentials? {
        get { self[option: BasicCredentials.self] }
        set { self[option: BasicCredentials.self] = newValue }
    }

}

public extension HTTPRequest {

    subscript<Option: HTTPRequestOption>(option type: Option.Type) -> Option.Value where Option: Hashable {
        get {
            // create the unique identifier for this type as our lookup key
            let id = ObjectIdentifier(type)

            // pull out any specified value from the options dictionary, if it's the right type
            // if it's missing or the wrong type, return the `defaultOptionValue`
            guard let value = options[id] as? Option.Value else { return type.defaultOptionValue }

            // return the value from the options dictionary
            return value
        }
        set {
            let id = ObjectIdentifier(type)
            // save the specified value into the options dictionary
            options[id] = newValue
        }
    }

}

extension HTTPRequest: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(urlComponents)
        hasher.combine(options)
        hasher.combine(method)
        hasher.combine(headers)
    }

    public static func == (lhs: HTTPRequest, rhs: HTTPRequest) -> Bool {
        lhs.urlComponents == rhs.urlComponents &&
        lhs.options == rhs.options &&
        lhs.method == rhs.method &&
        lhs.headers == rhs.headers
    }

}
