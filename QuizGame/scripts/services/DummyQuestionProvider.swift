//
//  DummyQuestionProvider.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

class DummyQuestionProvider : QuestionProvider {
    
    private let questions:[QuizQuestion]  = [
        QuizQuestion("Which one of these is Mario?",
                     1,
                     [ImageQuestionOption("Luigi"),ImageQuestionOption("Mario"),ImageQuestionOption("Peach"), ImageQuestionOption("Bowser")]),
        QuizQuestion("Which one of these is Bowser?",
                     2,
                     [ImageQuestionOption("Peach"),ImageQuestionOption("Luigi"),ImageQuestionOption("Bowser"), ImageQuestionOption("Mario")]),
        QuizQuestion("What dinosaur does Mario frequently ride on?",
                     0,
                     [TextQuestionOption("Yoshi"),TextQuestionOption("Birdo"),TextQuestionOption("Ridley"), TextQuestionOption("Bowser")])
    ]
    
    public func getQuizQuestion() -> QuizQuestion {
        if let question = questions.randomElement() {
            return question
        }
        return QuizQuestion()
    }
    
    public func getQuizQuestions(_ amount:Int) -> [QuizQuestion] {
        guard amount < questions.count else {
            return questions
        }
        
        return questions[randomPick: amount]
    }
}
