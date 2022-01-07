//
//  ImageQuestionOptionVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class ImageQuestionOptionState : QuestionOptionState {
    @Published private(set) var image:String = ""
    
    public init(_ option: ImageQuestionOption, _ isCorrect:Bool) {
        super.init(isCorrect)
        self.image = option.image
    }
}
