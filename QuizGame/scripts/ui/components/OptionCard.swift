//
//  optionCard.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct OptionCard<T> : View where T : View  {
    let content : T
    
    var body: some View {
        ZStack {
            content.padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .border(Color.black, width:5)
    }
    
    public init(@ViewBuilder _ content: () -> T) {
        self.content = content()
    }
}

struct OptionCard_Previews: PreviewProvider {
    static var previews: some View {
        OptionCard {
//            Image("Mario").resizable().scaledToFit()
            Text("helo there helo there helo there helo there helo there")
        }
    }
}
