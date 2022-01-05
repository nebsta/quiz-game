//
//  QuestionPanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionPanel: View {
    @State private var question:QuizQuestion
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ question:QuizQuestion) {
        self._question = State(initialValue: question)
    }
    
    var body: some View {
        VStack {
            Text(self.question.text)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.question.options.indices) { index in
                    let option = self.question.options[index]
                    OptionCard {
                        buildCardContent(option)
                    }.onTapGesture {
                        onOptionSelected(index)
                    }
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
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
//        QuestionPanel(QuizQuestion("Which one of these is Mario?",
//                                   1,
//                                   [ImageQuestionOption("Luigi"),ImageQuestionOption("Mario"),ImageQuestionOption("Peach"), ImageQuestionOption("Bowser")]))
        
        QuestionPanel(        QuizQuestion("What dinosaur does Mario frequently ride on?",
                                           0,
                                           [TextQuestionOption("Yoshi"),TextQuestionOption("Birdo"),TextQuestionOption("Ridley"), TextQuestionOption("Bowser")]))
    }
}
