//
//  ContentView.swift
//  OwnLab
//
//  Created by 김종혁 on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 0
    
    @State private var isMemberLoginValid: Bool = false
    @State private var isCompanyLoginValid: Bool = false
    
    @State private var autoLogin: Bool = false
    
    @State private var member_id: String = ""
    @State private var member_password: String = ""
    
    @State private var company_id: String = ""
    @State private var company_password: String = ""
    
    var body: some View {
        TabView(selection: $tabSelected) {
            NavigationView {
                VStack {
                    TextField("아이디", text: $member_id)
                        .border(Color.gray, width: 1)
                        .padding()
                        .frame(height: 48)
                        .padding(.bottom, 3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("비밀번호", text: $member_password)
                        .border(Color.gray, width: 1)
                        .padding()
                        .frame(height: 48)
                        .padding(.bottom, 35.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    NavigationLink(destination: HomeView(), isActive: $isMemberLoginValid, label: {
                        Text("로그인")
                            .bold()
                            .frame(width: 350, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                LoginValidCheck()
                            }
                    })
                    
                    HStack {
                        Toggle(isOn: $autoLogin) {
                            Text("자동 로그인")
                                .foregroundStyle(Color.black)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: FindingView(), label: {
                            Text("비밀번호 찾기")
                                .bold()
                                .foregroundColor(Color.black)
                                .cornerRadius(10)
                                .padding()
                        })
                    }
                    
                    HStack {
                        Text("아직 회원이 아니세요?")
                        NavigationLink(destination: RegisterView(), label: {
                            Text("회원가입")
                                .bold()
                                .foregroundColor(Color.blue)
                                .cornerRadius(10)
                                .padding()
                        })
                    }
                }
                .navigationTitle("Login Screen")
            }
            .tabItem {
                Image(systemName: "person")
                Text("구직자 회원")
            }.tag(0)
            
            NavigationView {
                VStack {
                    TextField("아이디", text: $company_id)
                        .border(Color.gray, width: 1)
                        .padding()
                        .frame(height: 48)
                        .padding(.bottom, 3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("비밀번호", text: $company_password)
                        .border(Color.gray, width: 1)
                        .padding()
                        .frame(height: 48)
                        .padding(.bottom, 35.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    NavigationLink(destination: HomeView(), isActive: $isCompanyLoginValid, label: {
                        Text("로그인")
                            .bold()
                            .frame(width: 350, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                LoginValidCheck()
                            }
                    })
                    
                    HStack {
                        Toggle(isOn: $autoLogin) {
                            Text("자동 로그인")
                                .foregroundStyle(Color.black)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: FindingView(), label: {
                            Text("비밀번호 찾기")
                                .bold()
                                .foregroundColor(Color.black)
                                .cornerRadius(10)
                                .padding()
                        })
                    }
                    
                    HStack {
                        Text("아직 회원이 아니세요?")
                        NavigationLink(destination: RegisterView(), label: {
                            Text("회원가입")
                                .bold()
                                .foregroundColor(Color.blue)
                                .cornerRadius(10)
                                .padding()
                        })
                    }
                }
                .navigationTitle("Login Screen")
            }
            .tabItem {
                Image(systemName: "person.badge.key")
                Text("기업 회원")
            }.tag(1)
        }
        
    }
    
    func LoginValidCheck() {
        if(tabSelected == 0) {
            if(String(member_id) != "") {
                if(String(member_password) != "") {
                    isMemberLoginValid = true
                }
            }
        } else {
            if(String(company_id) != "") {
                if(String(company_password) != "") {
                    isCompanyLoginValid = true
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
