//
//  Endpoint.swift
//  OwnLab
//
//  Created by 김종혁 on 1/18/24.
//

import Foundation

enum Endpoint {
    static let baseUrl: String = "https://albahr.co.kr/"
    
    case login
    
    func path() -> String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    
    var absoluteUrl: String {
        Endpoint.baseUrl + self.path()
    }
}
