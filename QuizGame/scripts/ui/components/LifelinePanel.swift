//
//  LifelinePanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct LifelinePanel: View {
    private let onLifelineSelected:(Lifeline) -> Void
    
    public init(_ onLifelineSelected:@escaping (Lifeline) -> Void) {
        self.onLifelineSelected = onLifelineSelected
    }
    
    var body: some View {
        HStack {
            LifelineButton(.FiftyFifty, onLifelineSelected)
            LifelineButton(.TenSeconds, onLifelineSelected)
        }
    }
}

struct LifelinePanel_Previews: PreviewProvider {
    static var previews: some View {
        LifelinePanel() { _ in
            
        }
    }
}
