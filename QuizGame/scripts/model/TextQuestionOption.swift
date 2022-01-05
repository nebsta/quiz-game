//
//  TextQuestionOption.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

class TextQuestionOption : QuestionOption {
    public let text:String;
    
    public init(_ text:String) {
        self.text = text;
    }
}
