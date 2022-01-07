//
//  QuestionTimer.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct QuestionTimer: View {
    @ObservedObject public var timer:TimerState
    
    private let onTimerExpired:() -> Void
    private let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(_ timer:TimerState, _ onTimerExpired:@escaping () -> Void) {
        self.timer = timer
        self.onTimerExpired = onTimerExpired
    }
    
    var body: some View {
        ZStack {
            Image("Clock")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .opacity(0.2)
            Text("\(self.timer.currentTimer)s")
                .font(.system(size: 30))
                .bold()
        }.onReceive(countdownTimer) { time in
            
            // timer has finished and already triggered callback
            guard self.timer.currentTimer != -1 else {
                return
            }
            
            guard !self.timer.paused else {
                return;
            }
            
            // the timer has finished
            guard self.timer.currentTimer > 0 else {
                self.timer.currentTimer = -1
                onTimerExpired()
                return
            }
            self.timer.currentTimer -= 1
        }
    }
}

struct QuestionTimer_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTimer(TimerState()) {
            
        }
    }
}
