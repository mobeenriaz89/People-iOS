//
//  UserDefaults.swift
//  People
//
//  Created by Mubeen Riaz on 12/09/2023.
//

import Foundation

struct AppDefaults {
    
    static let KEY_IS_LOGGED_IN = "isLoggedIn"
    
    static func setLoggedIn(loggedIn: Bool){
        let defaults = UserDefaults.standard
        defaults.set(loggedIn, forKey: KEY_IS_LOGGED_IN)
    }
    
    static func isLoggedIn() -> Bool{
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: KEY_IS_LOGGED_IN)
    }
}
