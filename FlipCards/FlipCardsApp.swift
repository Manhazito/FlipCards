//
//  FlipCardsApp.swift
//  FlipCards
//
//  Created by Filipe Ramos on 07/03/2024.
//

import SwiftUI

@main
struct FlipCardsApp: App {
    @State private var resources = Resources()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(resources)
        }
    }
}
