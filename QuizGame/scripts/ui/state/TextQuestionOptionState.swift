//
//  TextQuestionOptionVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class TextQuestionOptionState : QuestionOptionState {
    @Published private(set) var text:String = ""
    
    public init(_ option: TextQuestionOption, _ isCorrect:Bool) {
        super.init(isCorrect)
        self.text = option.text
    }
}
