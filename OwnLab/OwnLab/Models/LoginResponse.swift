//
//  LoginResponse.swift
//  OwnLab
//
//  Created by 김종혁 on 1/17/24.
//

import Foundation

struct LoginResponse: Codable {
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "Authorization"
    }
}
