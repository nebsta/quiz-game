//
//  QuestionPanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionPanel: View {
    @ObservedObject private var gameState:GameState
    @State private var higlightedIndex:Int
    
    private let onQuestionAnswered:(QuestionResult) -> Void
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ gameState:GameState, _ onQuestionAnswered:@escaping (QuestionResult) -> Void) {
        self.gameState = gameState
        self.onQuestionAnswered = onQuestionAnswered
        self.higlightedIndex = -1
    }
    
    var body: some View {
        VStack {
            let currentQuestion:QuizQuestion = self.gameState.currentQuestion()
            
            Text(currentQuestion.text)
                .multilineTextAlignment(.center)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(currentQuestion.options.enumerated()), id: \.offset) { index, option in
                    let isCorrect:Bool = self.higlightedIndex == index
                    OptionCard(index == currentQuestion.answerIndex, isCorrect) {
                        buildCardContent(option)
                    }.onTapGesture {
                        onOptionSelected(index, isCorrect)
                    }
                }
            }
            HStack {
                Button("Skip") {
                    onQuestionAnswered(.Skipped)
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
    
    func onOptionSelected(_ index:Int, _ isCorrect:Bool) {
        self.higlightedIndex = index
        self.onQuestionAnswered(isCorrect ? .Correct : .Incorrect)
    }
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPanel(GameState(DummyQuestionProvider().getQuizQuestions(2))) { _ in
            
        }
    }
}


enum QuestionResult {
    case Incorrect
    case Correct
    case Skipped
}
