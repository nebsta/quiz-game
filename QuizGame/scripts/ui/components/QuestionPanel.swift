//
//  QuestionPanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionPanel: View {
    @State var question:QuizQuestion
    
    public init(_ question:QuizQuestion) {
        self._question = State(initialValue: question)
    }
    
    var body: some View {
        ForEach(self.question.options) { option in
            if let imageOption = option as? ImageQuestionOption {
                Image(imageOption.image)
            } else if let textOption = option as? TextQuestionOption {
                Text(textOption.text)
            }
        }
    }
}

struct QuestionPanel_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPanel(QuizQuestion("Example Question", 0, []))
    }
}
