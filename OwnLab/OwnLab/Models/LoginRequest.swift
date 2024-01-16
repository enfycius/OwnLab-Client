//
//  LoginRequest.swift
//  OwnLab
//
//  Created by 김종혁 on 1/17/24.
//

import Foundation

struct LoginRequest: Codable {
    var email: String?
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case email
        case password = "pwd"
    }
}
