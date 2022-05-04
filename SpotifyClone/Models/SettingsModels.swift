//
//  SettingsModels.swift
//  SpotifyClone
//
//  Created by Andrei-Liviu Iliescu on 04.05.2022.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
} 
