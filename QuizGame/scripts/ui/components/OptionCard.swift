//
//  optionCard.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct OptionCard : View  {
    @ObservedObject private var option:QuestionOptionState
    
    var body: some View {
        ZStack {
            if let imageOption = option as? ImageQuestionOptionState {
                Image(imageOption.image).resizable().scaledToFit()
            } else if let textOption = option as? TextQuestionOptionState {
                Text(textOption.text)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .aspectRatio(1, contentMode: .fit)
        .border(Color.black, width:5)
        .background(self.option.state == .Highlighted ? highlightColor() : .white)
    }
    
    private func highlightColor() -> Color {
        return self.option.isCorrect ? .green : .red
    }
    
    public init(_ option:QuestionOptionState) {
        self.option = option
    }
}

struct OptionCard_Previews: PreviewProvider {
    static var previews: some View {
        OptionCard(ImageQuestionOptionState(ImageQuestionOption("Bowser"), true))
    }
}
