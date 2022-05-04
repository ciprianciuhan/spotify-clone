//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by Ciprian Cucu-Ciuhan on 29.04.2022.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
    let id: String
    let product: String
    let images: [APIImage]
}
