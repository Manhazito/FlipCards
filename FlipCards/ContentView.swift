//
//  ContentView.swift
//  FlipCards
//
//  Created by Filipe Ramos on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Environment & State
    @Environment(Resources.self) var resources
    @State private var flipped = false
    @State private var questionIdx = 0
    
    private var questionData: QuestionData {
        resources.data.questions[questionIdx]
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Card(question: questionData.question, answer: questionData.answer, flipped: $flipped)
                .frame(height: 300)
                .padding(10)

            Divider()
            
            if !flipped {
                Button {
                    flipped.toggle()
                } label: {
                    Text("Check")
                }
                .foregroundStyle(.white)
                .padding(5)
            } else {
                Button {
                    flipped.toggle()
                    questionIdx += 1
                } label: {
                    Text("Next")
                }
                .foregroundStyle(.white)
                .padding(5)
            }
            
            Spacer()
        }
        .animation(.default, value: flipped)
        .background(.teal)
    }
}

#Preview {
    ContentView()
        .environment(Resources())
}
