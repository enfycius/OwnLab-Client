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

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}
