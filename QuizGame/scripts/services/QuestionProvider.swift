//
//  QuestionProvider.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

protocol QuestionProvider {
    func getQuizQuestion() -> QuizQuestion
    func getQuizQuestions(_ amount:Int) -> [QuizQuestion]
}
