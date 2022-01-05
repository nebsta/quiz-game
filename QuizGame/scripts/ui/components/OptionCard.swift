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
    
    private let highlight:Bool
    
    var body: some View {
        ZStack {
            content.padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .border(Color.black, width:5)
        .background(highlight ? highlightColor() : .white)
    }
    
    private func highlightColor() -> Color {
        return isCorretAnswer ? .green : .red
    }
    
    public init(_ isCorrectAnswer:Bool, _ highlight:Bool, @ViewBuilder _ content: () -> T) {
        self.content = content()
        self.highlight = highlight
        self.isCorretAnswer = isCorrectAnswer
    }
}

struct OptionCard_Previews: PreviewProvider {
    static var previews: some View {
        OptionCard (true, false) {
//            Image("Mario").resizable().scaledToFit()
            Text("helo there helo there helo there helo there helo there")
        }
    }
}
