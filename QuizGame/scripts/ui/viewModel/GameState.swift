//
//  GameVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation
import SwiftUI

class GameState : ObservableObject {
    public static let QuestionTime:Int = 10
    
    @Published public var questions:[QuizQuestionState] = []
    
    @Published public var currentQuestionIndex:Int = 0
    @Published public var questionTimer:Int = QuestionTime
    
    @Published public var lifelinesUsed:Lifeline = .None
    
    @Published private(set) var summary:SummaryState = SummaryState()
    
    public init(_ questions:[QuizQuestion] = []) {
        for question in questions {
            self.questions.append(QuizQuestionState(question))
        }
    }
    
    public func currentQuestion() -> QuizQuestionState {
        guard currentQuestionIndex < questions.count else {
            return QuizQuestionState()
        }
        return questions[currentQuestionIndex]
    }
    
    public func reset(_ questions:[QuizQuestion]) {
        self.currentQuestionIndex = 0
        self.summary.reset()
        self.questionTimer = GameState.QuestionTime
        
        for question in questions {
            self.questions.append(QuizQuestionState(question))
        }
    }
    
    public func nextQuestion() {
        self.currentQuestionIndex += 1
        
        self.questionTimer = GameState.QuestionTime
    }
}

