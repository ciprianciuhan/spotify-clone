//
//  RecommendationsResponse.swift
//  SpotifyClone
//
//  Created by Andrei-Liviu Iliescu on 04.05.2022.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
