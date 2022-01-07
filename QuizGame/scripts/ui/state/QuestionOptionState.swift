//
//  QuestionOptionVM.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation

class QuestionOptionState : ObservableObject {
    @Published private(set) var isCorrect:Bool = false
    @Published public var state:OptionState = .Idle
    
    public init(_ isCorrect:Bool) {
        self.isCorrect = isCorrect
    }
}

enum OptionState {
    case Idle
    case Highlighted
}
