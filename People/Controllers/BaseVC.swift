//
//  BaseVC.swift
//  People
//
//  Created by Mubeen Riaz on 05/09/2023.
//

import UIKit
class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "AppBG.pdf")!)
    }
    
    func showAlertDialog(title:String?, message: String){
        let alertController = UIAlertController(title: title ?? "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let actionButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(actionButton)
        
        present(alertController, animated: true, completion: nil)
    }
    

}
