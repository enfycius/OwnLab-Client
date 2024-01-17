//
//  APIServices.swift
//  OwnLab
//
//  Created by 김종혁 on 1/17/24.
//

import Foundation
import Alamofire

struct AuthServices {
    public static let shared = AuthServices()
    
    func callLogin(parameters: Parameters? = nil, success: @escaping (_ result: LoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        
        headers["content-type"] = "application/json"
        
        APIManager.shared.callAPI(serverURL: "https://albahr.co.kr/auth/login", method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let createLoginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    success(createLoginResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
