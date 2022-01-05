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
            QuestionPanel(gameState, onQuestionAnswered)
            LifelinePanel(onLifelineSelected).frame(maxWidth:.infinity, maxHeight: 50)
            
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
        
        self.gameState.currentQuestionIndex += 1
    }
    
    private func onLifelineSelected(_ lifeline:Lifeline) {
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DummyQuestionProvider())
    }
}
