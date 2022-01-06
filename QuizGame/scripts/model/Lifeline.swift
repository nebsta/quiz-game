//
//  Lifeline.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 06/01/2022.
//

import Foundation

struct Lifeline : OptionSet {
    let rawValue: Int

    static let None = Lifeline(rawValue: 1 << 0)
    static let FiftyFifty = Lifeline(rawValue: 1 << 1)
    static let TenSeconds = Lifeline(rawValue: 1 << 2)
}
