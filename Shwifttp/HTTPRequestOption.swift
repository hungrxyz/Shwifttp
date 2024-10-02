//
//  HTTPRequestOption.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public protocol HTTPRequestOption {

    associatedtype Value: Hashable

    static var defaultOptionValue: Value { get }

}
