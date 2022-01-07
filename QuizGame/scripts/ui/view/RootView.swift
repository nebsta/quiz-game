//
//  RootView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var router:ViewRouter
    @EnvironmentObject private var gameState:GameState
    
    private let questionProvider:QuestionProvider
    
    public init() {
        self.questionProvider = DummyQuestionProvider()
    }
    
    var body: some View {
        switch self.router.currentRoute {
        case .MainMenu:
            MainMenuView()
        case .Game:
            GameView(self.questionProvider)
        case.Summary:
            SummaryView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
