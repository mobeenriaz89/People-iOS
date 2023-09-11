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
                self.dismiss(animated: true)
            }else{
                dismiss(animated: true)
            }
        }
    }
    
}
