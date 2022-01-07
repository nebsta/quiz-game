//
//  QuestionPanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionPanel: View {
    @ObservedObject private var question:QuizQuestionState
    
    private let onQuestionAnswered:(Int) -> Void
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(_ question:QuizQuestionState, _ onQuestionAnswered:@escaping (Int) -> Void) {
        self.question = question
        self.onQuestionAnswered = onQuestionAnswered
    }
    
    var body: some View {
        VStack {
            Text(self.question.text)
                .multilineTextAlignment(.center)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(self.question.options.enumerated()), id: \.offset) { index, option in
                    
                    OptionCard(self.question.options[index])
                        .onTapGesture { onOptionSelected(index) }
                }
            }
            HStack {
                Button("Skip") {
                    onQuestionAnswered(-1)
                }
            }
        }
    }
    
    func onOptionSelected(_ index:Int) {
        self.question.options[index].state = .Highlighted
        self.onQuestionAnswered(index)
    }
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPanel(QuizQuestionState(QuizQuestion("Test", 0, []))) { _ in
            
        }
    }
}
