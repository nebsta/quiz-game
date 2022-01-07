//
//  SummaryView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var viewRouter:ViewRouter
    
    private let gameState:GameState
    
    public init(_ gameState:GameState) {
        self.gameState = gameState
    }
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.system(size: 20))
                .bold()
                .padding()
            Text("Total Questions: \(self.gameState.questions.count)")
            Text("Correct Answers: \(self.gameState.summary.correctAnswers)")
            Text("Average Answer Time: \(String(format:"%.2f",self.gameState.summary.averageAnswerTime))s")
            
            HStack {
                Button("Retry", action: onRetryQuiz)
                    .buttonStyle(.bordered)
                Button("Quit", action: onQuitQuiz)
                    .buttonStyle(.bordered)
            }
            .padding()
        }
    }
    
    private func onRetryQuiz() {
        viewRouter.routeTo(.Game)
    }
    
    private func onQuitQuiz() {
        viewRouter.routeTo(.MainMenu)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(GameState())
    }
}
