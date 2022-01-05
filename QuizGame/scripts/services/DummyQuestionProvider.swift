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
                     3,
                     [ImageQuestionOption("Luigi"),ImageQuestionOption("Mario"),ImageQuestionOption("Peach"), ImageQuestionOption("Bowser")]),
        QuizQuestion("What dinosaur does Mario frequently ride on?",
                     0,
                     [TextQuestionOption("Yoshi"),TextQuestionOption("Birdo"),TextQuestionOption("Ridley"), TextQuestionOption("Bowser")])
    ]
    
    func getQuizQuestion() -> QuizQuestion {
        if let question = questions.randomElement() {
            return question
        }
        return QuizQuestion()
    }
    
}
