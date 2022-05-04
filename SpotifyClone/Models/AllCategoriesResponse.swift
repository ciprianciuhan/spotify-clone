//
//  AllCategoriesResponse.swift
//  SpotifyClone
//
//  Created by Andrei-Liviu Iliescu on 04.05.2022.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String 
    let name: String
    let icons: [APIImage]
}
