//
//  HomeVC.swift
//  People
//
//  Created by Mubeen Riaz on 08/09/2023.
//

import UIKit
import FirebaseAuth

class HomeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func didTapSignout(_ sender: Any) {
        FirebaseAuthModel.signout { success, msg in
            if !success{
                print("Error signing out: \(msg)")
                self.showAlertDialog(title: "Error", message: msg)
            }else{
                dismiss(animated: true)
            }
        }
    }
    
}
