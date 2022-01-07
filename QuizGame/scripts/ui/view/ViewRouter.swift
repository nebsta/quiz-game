//
//  ViewRouter.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 07/01/2022.
//

import Foundation
import SwiftUI

class ViewRouter : ObservableObject {
    @Published private(set) var currentRoute:ViewRoute
    
    public init() {
        self.currentRoute = .MainMenu
    }
    
    public func routeTo(_ route:ViewRoute) {
        self.currentRoute = route
    }
}
