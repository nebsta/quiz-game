//
//  MainMenuView.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var viewRouter:ViewRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Quiz Game")
                    .font(.system(size: 50))
                
                Button("Play") {
                    viewRouter.routeTo(.Game)
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
