//
//  View+Extensions.swift
//  FlipCards
//
//  Created by Filipe Ramos on 07/03/2024.
//

import SwiftUI

extension View {
    func flipHorizontaly(degrees: Double) -> some View {
        rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
    
    func cornerWith(radius: CGFloat, borderWidth: CGFloat = 1, borderColor: Color = .black, antialiased: Bool = true) -> some View {
        modifier(ModifierCornerWithBorder(radius: radius, borderWidth: borderWidth, borderColor: borderColor, antialiased: antialiased))
    }
}

fileprivate struct ModifierCornerWithBorder: ViewModifier {
    var radius: CGFloat
    var borderWidth: CGFloat = 1
    var borderColor: Color = .black
    var antialiased: Bool = true
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(self.radius, antialiased: self.antialiased)
            .overlay(
                RoundedRectangle(cornerRadius: self.radius)
                    .strokeBorder(self.borderColor, lineWidth: self.borderWidth, antialiased: self.antialiased)
            )
    }
}
