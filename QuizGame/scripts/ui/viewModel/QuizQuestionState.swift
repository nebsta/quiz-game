//
//  QuizQuestionVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class QuizQuestionState : ObservableObject {
    public static let OptionCount:Int = 4
    
    @Published private(set) var text:String = ""
    @Published private(set) var answerIndex:Int = 0
    @Published private(set) var options:[QuestionOptionState] = []
    
    public init() {
        
    }
    
    public init(_ question:QuizQuestion) {
        self.text = question.text
        self.answerIndex = question.answerIndex
        
        for index in (0...question.options.count-1) {
            let option:QuestionOption = question.options[index]
            let isCorrect:Bool = index == self.answerIndex
            if let imageOption = option as? ImageQuestionOption {
                options.append(ImageQuestionOptionState(imageOption, isCorrect))
            } else if let textOption = option as? TextQuestionOption {
                options.append(TextQuestionOptionState(textOption, isCorrect))
            }
        }
    }
    
    public func incorrectAnswers() -> [Int] {
        var incorrectAnswers:[Int] = [Int](options.indices.first!...options.indices.last!)
        incorrectAnswers.remove(at: self.answerIndex)
        return incorrectAnswers
    }
}
