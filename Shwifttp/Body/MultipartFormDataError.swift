//
//  MultipartFormDataError.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct MultipartFormDataError: Error {

    public enum Reason {

        case notAFileURL
        case fileIsUnreachable
        case unableToLoadFile

    }

    public let reason: Reason
    public let underlayingError: Error?

    public init(reason: Reason, underlayingError: Error? = nil) {
        self.reason = reason
        self.underlayingError = underlayingError
    }

}
