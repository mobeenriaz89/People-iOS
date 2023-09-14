//
//  UIExtensions.swift
//  People
//
//  Created by Mubeen Riaz on 14/09/2023.
//

import Foundation
import UIKit

extension UIButton {
  func makeRounded(cornerRadius: CGFloat) {
    self.layer.cornerRadius = cornerRadius
    self.layer.masksToBounds = true
  }
}
