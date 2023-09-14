//
//  ViewController.swift
//  People
//
//  Created by Mubeen Riaz on 17/08/2023.
//

import UIKit

class ViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        if AppDefaults.isLoggedIn(){
            self.dismiss(animated: false)
            self.performSegue(withIdentifier: "mainToHome", sender: self)
        }
    }

    

}

