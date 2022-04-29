//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by Ciprian Cucu-Ciuhan on 29.04.2022.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "77d4ea59694148eb972755b7967e3e82"
        static let clientSecret = "x"
    }
    
    private init(){}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.spotify.com"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)){
        
    }
    
    public func refreshAccessToken(){
        
    }
    
    public func cacheToken(){
        
    }
}
