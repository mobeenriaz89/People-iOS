//
//  SignUpVC.swift
//  People
//
//  Created by Mubeen Riaz on 08/09/2023.
//

import UIKit
import FirebaseAuth

class SignUpVC: BaseVC {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapRegister(_ sender: Any) {
        if let email = tfEmail.text, let password = tfPassword.text, let confirmPassword = tfConfirmPassword.text, password == confirmPassword{
            FirebaseAuthModel.signup(email: email, password: password) { isSuccess, msg in
                if !isSuccess{
                    self.showAlertDialog(title: "Error", message: msg)
                }else{
                    AppDefaults.setLoggedIn(loggedIn: true)
                    self.dismiss(animated: false)
                    self.performSegue(withIdentifier: "registerToHome", sender: self)
                }
            }
            
        }
    }
}
