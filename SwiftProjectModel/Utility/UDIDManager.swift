//
//  UDIDManager.swift
//  WojkSwift
//
//  Created by horse on 16/11/7.
//  Copyright © 2016年 zgl. All rights reserved.
//

import UIKit

class UDIDManager: NSObject {
    static func getStoredUDID() -> String {
        let cfuuid: CFUUID = CFUUIDCreate(kCFAllocatorDefault)
        let uuid = CFUUIDCreateString(kCFAllocatorDefault, cfuuid)
        
        return uuid! as String
    }
    
    static func getTempUUID() ->String {
        let cfuuid: CFUUID = CFUUIDCreate(kCFAllocatorDefault)
        let uuid = CFUUIDCreateString(kCFAllocatorDefault, cfuuid)
        return uuid! as String
    }
}
