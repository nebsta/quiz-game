//
//  ImageQuestionOption.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import Foundation

class ImageQuestionOption : QuestionOption {
    public let image:String;
    
    public init(_ image:String) {
        self.image = image;
    }
}
