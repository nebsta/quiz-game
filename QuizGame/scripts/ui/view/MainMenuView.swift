//
//  MainMenuView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct MainMenuView: View {
    
    private let questionProvider:QuestionProvider
    
    public init(_ questionProvider:QuestionProvider) {
        self.questionProvider = questionProvider
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Quiz Game")
                    .font(.system(size: 50))
                
                NavigationLink(destination: GameView(self.questionProvider)) {
                    Text("Play")
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(DummyQuestionProvider())
    }
}
