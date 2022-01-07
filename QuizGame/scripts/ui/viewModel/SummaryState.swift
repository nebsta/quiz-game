//
//  SummaryVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class SummaryState : ObservableObject {
    @Published public var correctAnswers:Int = 0
    @Published public var averageAnswerTime:Float = 0
    
    public func reset() {
        self.correctAnswers = 0
        self.averageAnswerTime = 0
    }
}
