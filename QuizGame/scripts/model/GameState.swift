//
//  GameState.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation
import SwiftUI

class GameState : ObservableObject {
    @Published public var questions:[QuizQuestion] = []
    @Published public var optionStates:[OptionState] = Array(repeating: .Idle, count: 4)
    @Published public var currentQuestionIndex:Int = 0
    @Published public var correctAnswers:Int = 0
    @Published public var averageAnswerTime:Float = 0
    @Published public var questionTimer:Int = 5
    @Published public var lifelinesUsed:Lifeline = .None
    
    public func currentQuestion() -> QuizQuestion {
        guard currentQuestionIndex < questions.count else {
            return QuizQuestion()
        }
        return questions[currentQuestionIndex]
    }
    
    public init(_ questions:[QuizQuestion] = []) {
        self.questions = questions
    }
    
    public func reset(_ questions:[QuizQuestion]) {
        self.questions = questions
        self.optionStates = Array(repeating: .Idle, count: 4)
        self.currentQuestionIndex = 0
        self.correctAnswers = 0
        self.averageAnswerTime = 0
        self.questionTimer = 5
    }
    
    public func resetTimer() {
        self.questionTimer = 5
    }
}

enum OptionState {
    case Idle
    case Highlighted
}
