//
//  GameView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject private var viewRouter:ViewRouter
    @EnvironmentObject private var gameState:GameState;

    private let questionProvider:QuestionProvider
    
    public init(_ questionProvider:QuestionProvider) {
        self.questionProvider = questionProvider
    }
    
    var body: some View {

        VStack {
            QuestionTimer(self.gameState.timer, onTimerExpired)
                .frame(maxHeight:80)
            QuestionPanel(self.gameState.currentQuestion(), onQuestionAnswered)
                .padding(.horizontal, 10)
            LifelinePanel(self.$gameState.lifelinesUsed, onLifelineSelected).frame(maxWidth:.infinity, maxHeight: 50)
            
        }.onAppear(perform: onViewAppear)
    }
    
    private func onViewAppear() {
        let questions:[QuizQuestion] = self.questionProvider.getQuizQuestions(2)
        gameState.reset(questions)
    }
    
    private func onQuestionAnswered(_ optionIndex:Int) {
        
        self.gameState.timer.paused = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            // check if we've reached the end of the quiz
            guard self.gameState.currentQuestionIndex + 1 < self.gameState.questions.count else {
                self.viewRouter.routeTo(.Summary)
                return
            }
            
            // record that a correct answer has been given
            if optionIndex == self.gameState.currentQuestion().answerIndex {
                self.gameState.summary.correctAnswers += 1
            }
            
            // reset timer and continue quiz
            self.gameState.nextQuestion()
        }
    }
    
    private func onTimerExpired() {
        onQuestionAnswered(-1)
    }
    
    private func onLifelineSelected(_ lifeline:Lifeline) {
        if lifeline == .TenSeconds {
            self.gameState.timer.currentTimer += 10
        } else if lifeline == .FiftyFifty {
            let incorrectAnswers:[Int] = self.gameState.currentQuestion().incorrectAnswers()
            let highlighted:[Int] = incorrectAnswers[randomPick: 2]
            for i in highlighted {
                self.gameState.currentQuestion().options[i].state = .Highlighted
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DummyQuestionProvider())
    }
}
