//
//  LifelineButton.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct LifelineButton: View {
    private let image:String
    private let lifelineType:Lifeline
    private let onTapped:(Lifeline) -> Void
    
    public init(_ lifeline:Lifeline, _ onTapped:@escaping (Lifeline) -> Void) {
        self.onTapped = onTapped
        self.lifelineType = lifeline
        switch lifeline {
            case .FiftyFifty:
                self.image = "LifelineOne"
            case .TenSeconds:
                self.image = "LifelineTwo"
        }
    }
    
    var body: some View {
        Button {
            onTapped(self.lifelineType)
        } label: {
            Image(self.image).resizable().scaledToFit()
        }
        .frame(maxHeight:.infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding(2)
    }
}

struct LifelineButton_Previews: PreviewProvider {
    static var previews: some View {
        LifelineButton(.FiftyFifty) { _ in
            
        }
    }
}
