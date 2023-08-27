//
//  BaseViewController.swift
//  People
//
//  Created by Mobeen Riaz on 27/08/2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    
    func assignbackground(){
            let background = #imageLiteral(resourceName: "AppBG")
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
}
