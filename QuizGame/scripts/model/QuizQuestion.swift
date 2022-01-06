//
//  QuizQuestion.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

class QuizQuestion : ObservableObject {
    public let text:String;
    public let answerIndex:Int;
    public let options:[QuestionOption];
    
    public init(_ question:String = "", _ answerIndex:Int = 0, _ options:[QuestionOption] = []) {
        self.text = question;
        self.answerIndex = answerIndex;
        self.options = options;
    }

    public func incorrectAnswers() -> [Int] {
        var incorrectAnswers:[Int] = [Int](options.indices.first!...options.indices.last!)
        incorrectAnswers.remove(at: self.answerIndex)
        return incorrectAnswers
    }
}
