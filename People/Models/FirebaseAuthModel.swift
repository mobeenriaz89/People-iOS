//
//  FirebaseAuthModel.swift
//  People
//
//  Created by Mubeen Riaz on 08/09/2023.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthModel {
    
    static func login(email: String, password: String, completion:@escaping (Bool,String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if error != nil{
                print("Login failed with error: \(String(describing: error?.localizedDescription))")
                completion(false,error?.localizedDescription ?? "Login failed")
            }else{
                completion(true,"Success")
            }
        }
    }
    
    static func signup(email: String, password: String, completion:@escaping (Bool,String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if error != nil{
                print("Login failed with error: \(String(describing: error?.localizedDescription))")
                completion(false,error?.localizedDescription ?? "Login failed")
            }else{
                completion(true,"Success")
            }
        }
    }
    
    static func signout(completion: (Bool, String?) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true, nil)
        }catch {
            print("Error signing out: \(error)")
            completion(false, error.localizedDescription)
        }
    }
    
}
