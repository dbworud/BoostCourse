//
//  MyFriends.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import Foundation

struct Friend : Codable {
    var name: String
    var age: Int
    var addressInfo: Address
    
    // CodingKey에 프로퍼티 모두 명시해야함
    enum CodingKeys: String, CodingKey {
        case addressInfo = "address_info"
        case name, age
    }
    
    struct Address : Codable {
        let country: String
        let city: String
    }
    
    var nameAndAge: String {
        return self.name + "\(self.age)"
    }
    
    var fullAddress: String {
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
 }
 
