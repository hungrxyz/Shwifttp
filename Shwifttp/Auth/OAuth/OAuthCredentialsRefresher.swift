//
//  OAuthCredentialsRefresher.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public protocol OAuthCredentialsRefresher {

    func refresh(using refreshToken: OAuthToken) async throws -> OAuthCredentials

}
