//
//  URLSessionDataLoading.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public protocol URLSessionDataLoading {

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)

}

public extension URLSessionDataLoading {

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }

}

extension URLSession: URLSessionDataLoading {
}
