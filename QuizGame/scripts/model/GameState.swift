//
//  GameState.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation
import SwiftUI

class GameState : ObservableObject {
    public static let OptionCount:Int = 4
    public static let QuestionTime:Int = 10
    
    @Published public var questions:[QuizQuestion] = []
    @Published public var optionStates:[OptionState] = Array(repeating: .Idle, count: OptionCount)
    @Published public var currentQuestionIndex:Int = 0
    @Published public var correctAnswers:Int = 0
    @Published public var averageAnswerTime:Float = 0
    @Published public var questionTimer:Int = QuestionTime
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
        self.optionStates = Array(repeating: .Idle, count: GameState.OptionCount)
        self.currentQuestionIndex = 0
        self.correctAnswers = 0
        self.averageAnswerTime = 0
        self.questionTimer = GameState.QuestionTime
    }
    
    public func nextQuestion() {
        self.currentQuestionIndex += 1
        self.questionTimer = GameState.QuestionTime
        self.optionStates = Array(repeating: .Idle, count: GameState.OptionCount)
    }
}

enum OptionState {
    case Idle
    case Highlighted
}
