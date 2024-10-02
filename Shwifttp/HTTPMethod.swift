//
//  HTTPMethod.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct HTTPMethod: Hashable {

    public let rawValue: String

    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let delete = HTTPMethod(rawValue: "DELETE")

}
