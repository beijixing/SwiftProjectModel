//
//  Uiview+Corner.swift
//  WojkSwift
//
//  Created by horse on 16/11/14.
//  Copyright © 2016年 zgl. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get{
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get{
            return UIColor(cgColor:layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
   
}
