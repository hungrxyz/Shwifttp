//
//  URLSessionLoader.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public final class URLSessionLoader: HTTPLoader {

    private let session: URLSessionDataLoading

    public init(session: URLSessionDataLoading) {
        self.session = session
    }

    @discardableResult
    public override func load(request: HTTPRequest) async throws -> HTTPResponse {
        guard let url = request.url else {
            throw HTTPError(reason: .invalidRequest, request: request)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        for (key, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: key.rawValue)
        }

        if let body = request.body {
            do {
                let data = try body.encode()

                urlRequest.httpBody = data

                for (key, value) in body.additionalHeaders {
                    urlRequest.addValue(value, forHTTPHeaderField: key.rawValue)
                }
            } catch {
                throw HTTPError(reason: .invalidRequest, request: request, underlyingError: error)
            }
        }

        do {
            let (data, urlResponse) = try await session.data(for: urlRequest)

            guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
                throw HTTPError(reason: .invalidResponse, request: request)
            }

            let response = HTTPResponse(request: request,
                                        response: httpURLResponse,
                                        body: data)

            guard httpURLResponse.isSuccessful else {
                throw HTTPError(reason: .unsuccessfulStatus, request: request, response: response)
            }

            return response
        } catch let error as HTTPError {
            throw error
        } catch let error as URLError {
            throw HTTPError(reason: .urlError, request: request, underlyingError: error)
        } catch {
            throw HTTPError(reason: .unknown, request: request, underlyingError: error)
        }
    }

}

private extension HTTPURLResponse {

    var isSuccessful: Bool {
        (200..<300).contains(statusCode)
    }

}
