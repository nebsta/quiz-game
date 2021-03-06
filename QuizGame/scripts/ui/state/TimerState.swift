//
//  TimerState.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class TimerState : ObservableObject {
    public static let MaxQuestionTime:Int = 10
    
    @Published public var currentTimer:Int = MaxQuestionTime
    @Published public var paused:Bool = false
    
    public func reset() {
        self.currentTimer = TimerState.MaxQuestionTime
        self.paused = false
    }
}
