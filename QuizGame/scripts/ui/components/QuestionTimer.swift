//
//  QuestionTimer.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionTimer: View {
    @Binding public var timeRemaining:Int
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(_ timeRemaining:Binding<Int>) {
        self._timeRemaining = timeRemaining
    }
    
    var body: some View {
        ZStack {
            Image("Clock")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .opacity(0.2)
            Text("\(self.timeRemaining)s")
                .font(.system(size: 30))
                .bold()
        }.onReceive(countdownTimer) { time in
            guard self.timeRemaining > 0 else {
                return
            }
            self.timeRemaining -= 1
        }
    }
}

struct QuestionTimer_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTimer(.constant(20))
    }
}
