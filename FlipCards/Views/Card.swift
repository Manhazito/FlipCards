//
//  Card.swift
//  FlipCards
//
//  Created by Filipe Ramos on 07/03/2024.
//

import SwiftUI

struct Card: View {
    var question: String
    var answer: String
    @Binding var flipped: Bool
    
    private var flipDegrees: Double { flipped ? 180.0 : 0.0 }

    private let padding: CGFloat = 10
    private let backgroundColor: Color = .white
    private let borderWidth: CGFloat = 2
    private let cornerRadius: CGFloat = 8
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text(question)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(padding)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(backgroundColor)
                    .cornerWith(radius: cornerRadius, borderWidth: borderWidth)
                    .opacity(flipped ? 0.0 : 1.0)
                    .flipHorizontaly(degrees: -flipDegrees)
                Text(answer)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(padding)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(backgroundColor)
                    .cornerWith(radius: cornerRadius, borderWidth: borderWidth)
                    .opacity(!flipped ? 0.0 : 1.0)
                    .flipHorizontaly(degrees: 180 - flipDegrees)
            }
        }
    }
}

#Preview {
    Card(question: "Question?", answer: "Answer…", flipped: .constant(false))
        .frame(height: 400)
}
