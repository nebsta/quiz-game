//
//  QuestionTimer.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionTimer: View {
    @Binding public var timeRemaining:Int
    
    private let onTimerExpired:() -> Void
    private let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(_ timeRemaining:Binding<Int>, _ onTimerExpired:@escaping () -> Void) {
        self._timeRemaining = timeRemaining
        self.onTimerExpired = onTimerExpired
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
            
            // timer has finished and already triggered callback
            guard self.timeRemaining != -1 else {
                return
            }
            
            // the timer has finished
            guard self.timeRemaining > 0 else {
                self.timeRemaining = -1
                onTimerExpired()
                return
            }
            self.timeRemaining -= 1
        }
    }
}

struct QuestionTimer_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTimer(.constant(20)) {
            
        }
    }
}
