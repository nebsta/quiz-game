//
//  QuizQuestion.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

struct QuizQuestion {
    public let question:String;
    public let answerIndex:Int;
    public let options:[QuestionOption];
    
    public init(_ question:String = "", _ answerIndex:Int = 0, _ options:[QuestionOption] = []) {
        self.question = question;
        self.answerIndex = answerIndex;
        self.options = options;
    }

}
