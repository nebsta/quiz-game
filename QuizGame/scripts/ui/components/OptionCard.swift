//
//  optionCard.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct OptionCard<T> : View where T : View  {
    private let content : T
    private let isCorretAnswer:Bool
    
    private let state:OptionState
    
    var body: some View {
        ZStack {
            content.padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .border(Color.black, width:5)
        .background(self.state == .Highlighted ? highlightColor() : .white)
    }
    
    private func highlightColor() -> Color {
        return isCorretAnswer ? .green : .red
    }
    
    public init(_ isCorrectAnswer:Bool, _ state:OptionState, @ViewBuilder _ content: () -> T) {
        self.content = content()
        self.state = state
        self.isCorretAnswer = isCorrectAnswer
    }
}

struct OptionCard_Previews: PreviewProvider {
    static var previews: some View {
        OptionCard (true, .Idle) {
//            Image("Mario").resizable().scaledToFit()
            Text("helo there helo there helo there helo there helo there")
        }
    }
}
