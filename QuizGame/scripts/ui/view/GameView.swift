//
//  GameView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameState:GameState = GameState();

    private let questionProvider:QuestionProvider
    
    public init(_ questionProvider:QuestionProvider) {
        self.questionProvider = questionProvider
    }
    
    var body: some View {

        VStack {
            QuestionPanel(gameState, onNextQuestion)
            
            
        }.onAppear(perform: onViewAppear)
    }
    
    private func onViewAppear() {
        print("setup")
        let questions:[QuizQuestion] = self.questionProvider.getQuizQuestions(2)
        gameState.reset(questions)
    }
    
    private func onNextQuestion() {
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DummyQuestionProvider())
    }
}
