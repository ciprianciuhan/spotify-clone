//
//  APICaller.swift
//  SpotifyClone
//
//  Created by Ciprian Cucu-Ciuhan on 29.04.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void){
        //TO DO: part 4, minutul 3:20
    }
}
