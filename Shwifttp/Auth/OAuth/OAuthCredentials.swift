//
//  OAuthCredentials.swift
//  Shwifttp
//
//  Created by marko on 03/10/2024.
//

import Foundation

public struct OAuthCredentials: Hashable {

    public let refreshToken: OAuthToken?
    public let accessToken: OAuthToken?

    public init(refreshToken: OAuthToken?, accessToken: OAuthToken?) {
        self.refreshToken = refreshToken
        self.accessToken = accessToken
    }

}
