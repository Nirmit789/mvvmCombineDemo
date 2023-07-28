//
//  Model.swift
//  MVVMDemo
//
//  Created by Nirmit Patel on 28/07/23.
//

import Foundation

struct User: Codable, Hashable {
    var id: Int
    var uid: String
    var firstName: String
    var lastName: String
    var userName: String
    var email: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case uid = "uid"
            case firstName = "first_name"
            case lastName = "last_name"
            case userName = "username"
            case email = "email"
            case avatar = "avatar"
    }
    
}
