//
//  QuestionProvider.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

protocol QuestionProvider {
    func getQuizQuestion() -> QuizQuestion
}
