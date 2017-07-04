//
//  WTools.swift
//  WojkSwift
//
//  Created by horse on 16/11/7.
//  Copyright © 2016年 zgl. All rights reserved.
//

import UIKit

func MainColor() ->UIColor {
    return UIColor.RGBA(r: 255, g: 113, b: 93, a: 1.0)
}

func MainScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
}

func MainScreenHeight() -> CGFloat {
    return UIScreen.main.bounds.size.height
}

func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}

func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
    #endif
}
