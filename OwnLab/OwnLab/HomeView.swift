//
//  HomeView.swift
//  OwnLab
//
//  Created by 김종혁 on 11/19/23.
//

import SwiftUI

struct HomeView: View {
    let regions = ["서울 > 구로/영등포/신도림"]
    
    @State private var searchText = ""
    @State private var selection: String? = nil
    
    init() {
        self.selection = regions[0]
    }
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = CGFloat(500)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    HStack {
                        Image(systemName: "timelapse")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(10)
                        
                        SearchBar(text: $searchText)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    .frame(width: w, height: h / 6)
                    
                    TabView {
                        ForEach(1..<5) { index in
                            Text("Test")
                                .frame(width: w, height: 150)
                        }
                    }
                    .background(Color.blue)
                    .tabViewStyle(.page)
                    .frame(width: w, height: 150)
                    
                    HStack {
                        
                        VStack {
                            Image(systemName: "timelapse")
                            Text("맞춤")
                        }
                        .padding(20)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "timelapse")
                            Text("지역")
                        }
                        .padding(20)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "timelapse")
                            Text("지도")
                        }
                        .padding(20)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "timelapse")
                            Text("단기")
                        }
                        .padding(20)
                        
                    }
                    .frame(width: w, height: 100)
                    
                    Section(header: Text("지역")
                        .padding(10)
                        .frame(width: w, alignment: .leading)
                    ) {
                        
                        Picker("지역을 선택해주세요.", selection: $selection) {
                            ForEach(regions, id: \.self) {
                                Text($0)
                            }
                        }
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<5) {
                                Text("Item \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(.blue)
                            }
                        }
                    }
                    .frame(width: w, height: 200)
                }
            }
        }
        .hiddenNavigationBarStyle()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    HomeView()
}
