//
//  SearchResult.swift
//  SpotifyClone
//
//  Created by Andrei-Liviu Iliescu on 04.05.2022.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
