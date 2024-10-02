//
//  OAuthCredentialsKeeper.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

import Foundation

public protocol OAuthCredentialsKeeper {

    func accessToken() async throws -> OAuthToken

    func refreshToken() async throws -> OAuthToken

    func keep(token: OAuthToken)

    func keep(credentials: OAuthCredentials)

}
