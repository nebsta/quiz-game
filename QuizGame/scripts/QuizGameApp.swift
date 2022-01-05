//
//  QuizGameApp.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

@main
struct QuizGameApp: App {
    
    private let questionProvider:QuestionProvider
    
    var body: some Scene {
        WindowGroup {
            MainMenuView(self.questionProvider)
        }
    }
    
    init() {
        self.questionProvider = DummyQuestionProvider()
    }
}
