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
    
    private let onNextQuestion:() -> Void
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ gameState:GameState, _ onNextQuestion:@escaping () -> Void) {
        self.gameState = gameState
        self.onNextQuestion = onNextQuestion
        self.higlightedIndex = -1
    }
    
    var body: some View {
        VStack {
            let currentQuestion:QuizQuestion = self.gameState.currentQuestion()
            Text(currentQuestion.text)
                .multilineTextAlignment(.center)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(currentQuestion.options.enumerated()), id: \.offset) { index, option in
                    OptionCard(index == currentQuestion.answerIndex, self.higlightedIndex == index) {
                        buildCardContent(option)
                    }.onTapGesture {
                        onOptionSelected(index)
                    }
                }
            }
            HStack {
                Button("Skip") {
                    onSkipQuestion()
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
        print("index: \(index)");
    }
    
    func onSkipQuestion() {
        self.onNextQuestion()
    }
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
//        QuestionPanel(QuizQuestion("Which one of these is Mario?",
//                                   1,
//                                   [ImageQuestionOption("Luigi"),ImageQuestionOption("Mario"),ImageQuestionOption("Peach"), ImageQuestionOption("Bowser")]))
        
//        QuestionPanel(QuizQuestion("What dinosaur does Mario frequently ride on?",
//                       0,
//                                   [TextQuestionOption("Yoshi"),TextQuestionOption("Birdo"),TextQuestionOption("Ridley"), TextQuestionOption("Bowser")])) {
//            
//        }
        
        Text("Test")
    }
}
