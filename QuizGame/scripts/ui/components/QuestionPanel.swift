//
//  QuestionPanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionPanel: View {
    @ObservedObject private var gameState:GameState
    
    private let onQuestionAnswered:(Int) -> Void
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ gameState:GameState, _ onQuestionAnswered:@escaping (Int) -> Void) {
        self.gameState = gameState
        self.onQuestionAnswered = onQuestionAnswered
    }
    
    var body: some View {
        VStack {
            let currentQuestion:QuizQuestion = self.gameState.currentQuestion()
            
            Text(currentQuestion.text)
                .multilineTextAlignment(.center)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(currentQuestion.options.enumerated()), id: \.offset) { index, option in
                    
                    let state:OptionState = self.gameState.optionStates[index]
                    OptionCard(index == currentQuestion.answerIndex, state) {
                        buildCardContent(option)
                    }.onTapGesture {
                        onOptionSelected(index)
                    }
                }
            }
            HStack {
                Button("Skip") {
                    onQuestionAnswered(-1)
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildCardContent(_ option:QuestionOption) -> some View {
        if let imageOption = option as? ImageQuestionOption {
            Image(imageOption.image).resizable().scaledToFit()
        } else if let textOption = option as? TextQuestionOption {
            Text(textOption.text)
        }
    }
    
    func onOptionSelected(_ index:Int) {
        self.gameState.optionStates[index] = .Highlighted
        self.onQuestionAnswered(index)
    }
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPanel(GameState(DummyQuestionProvider().getQuizQuestions(2))) { _ in
            
        }
    }
}
