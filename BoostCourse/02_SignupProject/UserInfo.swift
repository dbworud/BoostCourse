//
//  UserInfo.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import Foundation

// Singleton

class UserInfo {
    static let shared = UserInfo()
    
    var id: String?
    var password: String?
}
