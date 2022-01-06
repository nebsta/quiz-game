//
//  GameView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameState:GameState = GameState();
    @State var quizComplete:Bool = false

    private let questionProvider:QuestionProvider
    
    public init(_ questionProvider:QuestionProvider) {
        self.questionProvider = questionProvider
    }
    
    var body: some View {

        VStack {
            QuestionTimer(self.$gameState.questionTimer, onTimerExpired)
                .frame(maxHeight:80)
            QuestionPanel(self.gameState, onQuestionAnswered)
                .padding(.horizontal, 10)
            LifelinePanel(self.$gameState.lifelinesUsed, onLifelineSelected).frame(maxWidth:.infinity, maxHeight: 50)
            
            NavigationLink(destination: SummaryView(), isActive: self.$quizComplete) {EmptyView()}
            
        }.onAppear(perform: onViewAppear)
    }
    
    private func onViewAppear() {
        let questions:[QuizQuestion] = self.questionProvider.getQuizQuestions(2)
        gameState.reset(questions)
    }
    
    private func onQuestionAnswered(_ result:QuestionResult) {
        
        // check if we've reached the end of the quiz
        guard self.gameState.currentQuestionIndex + 1 < self.gameState.questions.count else {
            self.quizComplete = true
            return
        }
        
        if result == .Correct {
            self.gameState.correctAnswers += 1
        }
        
        self.gameState.resetTimer()
        self.gameState.currentQuestionIndex += 1
    }
    
    private func onTimerExpired() {
        onQuestionAnswered(.Skipped)
    }
    
    private func onLifelineSelected(_ lifeline:Lifeline) {
        if lifeline == .TenSeconds {
            self.gameState.questionTimer += 10
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DummyQuestionProvider())
    }
}
