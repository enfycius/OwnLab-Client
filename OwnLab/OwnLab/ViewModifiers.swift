//
//  ViewModifiers.swift
//  OwnLab
//
//  Created by 김종혁 on 11/24/23.
//

import Foundation
import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}
