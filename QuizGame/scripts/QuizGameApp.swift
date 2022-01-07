//
//  QuizGameApp.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

@main
struct QuizGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ViewRouter())
                .environmentObject(GameState())
        }
    }
}
