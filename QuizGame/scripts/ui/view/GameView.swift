//
//  GameView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct GameView: View {
    
    @State var gameState:GameState;
    
    private let questionProvider:QuestionProvider
    
    public init(_ questionProvider:QuestionProvider) {
        self.questionProvider = questionProvider
        
        let firstQuestion:QuizQuestion = self.questionProvider.getQuizQuestion()
        self._gameState = State(initialValue:GameState(firstQuestion))
    }
    
    var body: some View {
        QuestionPanel(gameState.currentQuestion)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DummyQuestionProvider())
    }
}
