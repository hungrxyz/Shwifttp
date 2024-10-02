//
//  HTTPBody.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public protocol HTTPBody {

    var additionalHeaders: [HTTPHeaderKey: String] { get }

    func encode() throws -> Data

}

public extension HTTPBody {

    var additionalHeaders: [HTTPHeaderKey: String] { [:] }

}
