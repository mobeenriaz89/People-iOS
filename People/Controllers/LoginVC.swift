//
//  SignUpVC.swift
//  People
//
//  Created by Mubeen Riaz on 08/09/2023.
//

import UIKit
import FirebaseAuth

class LoginVC: BaseVC {
        
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.text = "mobeenriaz89@gmail.com"
        tfPassword.text = "abc123"
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        showSpinner()
        if let email = tfEmail.text, let password = tfPassword.text{
            //Autheticating user with Firebase Authentication
            FirebaseAuthModel.login(email: email, password: password) { isSuccess, msg in
                self.hideSpinner()
                if !isSuccess{
                    self.showAlertDialog(title: "Error", message: msg)
                }else{
                    AppDefaults.setLoggedIn(loggedIn: true)
                    self.dismiss(animated: false)
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }
            }
        }
    }
}
