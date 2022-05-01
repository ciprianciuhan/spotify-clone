//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by Ciprian Cucu-Ciuhan on 01.05.2022.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
