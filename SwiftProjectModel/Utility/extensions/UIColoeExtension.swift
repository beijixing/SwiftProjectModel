//
//  UIColoeExtension.swift
//  WojkSwift
//
//  Created by horse on 16/11/28.
//  Copyright © 2016年 zgl. All rights reserved.
//

import UIKit

extension UIColor {
    class func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor {
        return UIColor(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:a)
    }
    
    class func RandomColor() -> UIColor {
        let r: CGFloat = CGFloat(arc4random()%255)
        let g: CGFloat = CGFloat(arc4random()%255)
        let b: CGFloat = CGFloat(arc4random()%255)
        return RGBA(r: r, g: g, b: b, a: 1.0)
    }
}
