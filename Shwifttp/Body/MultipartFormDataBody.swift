//
//  MultipartFormDataBody.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation
import UniformTypeIdentifiers

/// https://datatracker.ietf.org/doc/html/rfc7578
public struct MultipartFormDataBody: HTTPBody {

    private struct BodyPart {

        let headers: [HTTPHeader]
        let data: Data

    }

    private let fileManager: FileManager
    private let boundary: String

    public init(fileManager: FileManager = .default, boundary: String? = nil) {
        self.fileManager = fileManager
        self.boundary = boundary ?? UUID().uuidString
    }

    private let doubleDash = "--"
    private let newline = "\r\n"

    private var bodyParts = [BodyPart]()

    public mutating func append(data: Data, mimeType: String, name: String, filename: String? = nil) {
        let dispositionValue = makeDispositionHeaderValue(partName: name, filename: filename)
        let headers = [
            HTTPHeader(key: .contentDisposition, value: dispositionValue),
            HTTPHeader(key: .contentType, value: mimeType)
        ]
        let part = BodyPart(headers: headers, data: data)

        bodyParts.append(part)
    }

    public mutating func append(string: String, name: String) {
        let data = Data(string.utf8)
        let mimeType = UTType.plainText.preferredMIMEType ?? "text/plain"
        append(data: data, mimeType: mimeType, name: name)
    }

    public mutating func append(fileURL: URL, name: String) throws {
        let filename = fileURL.lastPathComponent
        let mimeType = UTType(filenameExtension: fileURL.pathExtension)?.preferredMIMEType ?? "application/octet-stream"

        guard fileURL.isFileURL, filename.isEmpty == false else {
            throw MultipartFormDataError(reason: .notAFileURL)
        }

        do {
            let isReachable = try fileURL.checkPromisedItemIsReachable()
            guard isReachable else {
                throw MultipartFormDataError(reason: .fileIsUnreachable)
            }
        } catch {
            throw MultipartFormDataError(reason: .fileIsUnreachable, underlayingError: error)
        }

        var isDirectory: ObjCBool = false
        let path: String
        if #available(iOS 16.0, *) {
            path = fileURL.path()
        } else {
            path = fileURL.path
        }

        let fileExists = fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
        guard fileExists, isDirectory.boolValue == false else {
            throw MultipartFormDataError(reason: .notAFileURL)
        }

        do {
            let data = try Data(contentsOf: fileURL)

            append(data: data, mimeType: mimeType, name: name, filename: filename)
        } catch {
            throw MultipartFormDataError(reason: .unableToLoadFile, underlayingError: error)
        }
    }

    public var additionalHeaders: [HTTPHeaderKey : String] {
        [.contentType: "multipart/form-data; boundary=\(boundary)"]
    }

    public func encode() throws -> Data {
        let formData = NSMutableData()

        for part in bodyParts {
            // Start boundary
            formData.append([doubleDash, boundary].joined())
            formData.append(newline)

            // Headers
            for header in part.headers {
                formData.append(header.rawHeader)
                formData.append(newline)
            }

            // Data
            formData.append(newline)
            formData.append(part.data)
            formData.append(newline)
        }
        // End boundary
        formData.append([doubleDash, boundary, doubleDash].joined())

        return formData as Data
    }

}

private extension MultipartFormDataBody {

    func makeDispositionHeaderValue(partName: String, filename: String?) -> String {
        var value = "form-data; name=\"\(partName)\""
        if let filename {
            value.append("; filename=\"\(filename)\"")
        }
        return value
    }

}

private extension HTTPHeader {

    var rawHeader: String {
        [key.rawValue, value].joined(separator: ": ")
    }

}

private extension NSMutableData {

    func append(_ string: String) {
        self.append(Data(string.utf8))
    }

}
