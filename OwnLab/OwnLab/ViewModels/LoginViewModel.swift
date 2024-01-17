//
//  LoginViewModel.swift
//  OwnLab
//
//  Created by 김종혁 on 1/18/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var loginResponse: LoginResponse?
    
    func createLogin(request: LoginRequest) {
        let dict = try? request.asDictionary()
        
        AuthServices.shared.callLogin(parameters: dict) { response in
            if let response = response {
                print(response)
                
                self.loginResponse = response
            }
        }
        
        failure: { error in
            print(error)
        }
    }
}
