//
//  GameState.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

struct GameState {
    public var currentQuestion:QuizQuestion
    public var correctAnswers:Int = 0
    public var totalQuestions:Int = 1
    public var averageAnswerTime:Float = 0
    
    public init(_ currentQuestion:QuizQuestion) {
        self.currentQuestion = currentQuestion
    }
}
