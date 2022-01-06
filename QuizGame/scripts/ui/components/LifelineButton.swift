//
//  LifelineButton.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct LifelineButton: View {
    private let used:Bool
    private let image:String
    private let lifelineType:Lifeline
    private let onTapped:(Lifeline) -> Void
    
    public init(_ lifeline:Lifeline, _ used:Bool, _ onTapped:@escaping (Lifeline) -> Void) {
        self.onTapped = onTapped
        self.lifelineType = lifeline
        self.used = used
        switch lifeline {
            case .FiftyFifty:
                self.image = "LifelineOne"
            case .TenSeconds:
                self.image = "LifelineTwo"
            default:
                self.image = "LifelineOne"
        }
    }
    
    var body: some View {
        Button {
            onTapped(self.lifelineType)
        } label: {
            ZStack {
                
                Image(self.image).resizable().scaledToFit()
                if used {
                    Image("Cross").resizable().scaledToFit().opacity(0.8)
                }
            }
        }
        .frame(maxHeight:.infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding(2)
        
    }
}

struct LifelineButton_Previews: PreviewProvider {
    static var previews: some View {
        LifelineButton(.FiftyFifty, true) { _ in
            
        }
    }
}
