//
//  ExtenstionView.swift
//  RsturentApp
//
//  Created by Hany Karam on 2/22/21.
//

import UIKit
extension UIView{
    func static_shadow(withOffset value:CGSize,color: CGColor){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 3.5
        self.layer.shadowOffset = value
        self.layer.shadowRadius = 6
        
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}
