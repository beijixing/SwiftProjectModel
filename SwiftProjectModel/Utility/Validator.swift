//
//  Validator.swift
//  WojkSwift
//
//  Created by horse on 16/11/28.
//  Copyright © 2016年 zgl. All rights reserved.
//

import Foundation

func isEmail(_ email: String) -> Bool {
    if email.isEmpty {
        return false
    }
    
    let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    do{
        let matcher: RegexHelper = try RegexHelper(mailPattern)
        if matcher.math(email) {
            return true
        }
    }catch {
        return false
    }
    return false
}
/*
 中国移动：
 139、138、137、136、135、134、159、158、157、150、151、152、147(数据卡)、188、187、182、183、184、178
 
 移动网络制式： 2G GSM；3G TD-SCDMA；4G TDD-LTE
 
 中国联通：
 130、131、132、156、155、186、185、145(数据卡)、176
 
 联通网络制式： 2G GSM；3G WCDMA；4G FDD-LTE和TDD-LTE
 
 中国电信：
 133、153、189、180、181、177、173(待放)
 
 电信网络制式： 2G CDMA；3G CDMA2000；4G FDD-LTE和TDD-LTE
 虛拟运营商： 1700、1705、1707、1708、1709......代理联通移动电信业务
 */
func isPhoneNumber(_ phone: String) -> Bool {
    if phone.isEmpty || phone.utf8.count != 11{
        return false
    }
    
    let phoneNumPattern = "^((1{1})([3 4 5 7 8])([0-9]{9}))$"
    do{
        let matcher: RegexHelper = try RegexHelper(phoneNumPattern)
        if matcher.math(phone) {
            return true
        }
    }catch {
        return false
    }
    return false
}

func isInputEmpty(_ data: Array<String>) -> Bool {
    for str in data {
        if str.isEmpty {
            return true
        }
    }
    return false
}
