//
//  RegexHelper.swift
//  WojkSwift
//
//  Created by horse on 16/11/28.
//  Copyright © 2016年 zgl. All rights reserved.
//

import Foundation

/*
 let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
 
 do{
 let matcher: RegexHelper = try RegexHelper(mailPattern)
 let maybeEmail = "long@onewcat.com"
 if matcher.math(maybeEmail) {
 print("有效的邮箱地址")
 }
 
 }catch {
 
 }
 
 
 if "long_555@126" =~ mailPattern {
 print("有效的二邮箱地址")
 }else{
 print("无效的邮箱地址")
 }
 */

struct RegexHelper {
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex =  NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func math(_ input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
    
}

precedencegroup MatchPrecedence {
    associativity: none
    higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

func =~(lhs: String, rhs:String) -> Bool {
    do {
        return try RegexHelper(rhs).math(lhs)
    } catch _ {
        return false
    }
}
