//
//  LifelinePanel.swift
//  QuizGame
//
//  Created by Benjamin Wallis on 05/01/2022.
//

import SwiftUI

struct LifelinePanel: View {
    @Binding private var lifelinesUsed:Lifeline
    
    private let onLifelineSelected:(Lifeline) -> Void
    
    public init(_ lifelinesUsed:Binding<Lifeline>, _ onLifelineSelected:@escaping (Lifeline) -> Void) {
        self.onLifelineSelected = onLifelineSelected
        self._lifelinesUsed = lifelinesUsed
    }
    
    var body: some View {
        HStack {
            LifelineButton(.FiftyFifty, self.lifelinesUsed.contains(.FiftyFifty), onLifelineTapped)
            LifelineButton(.TenSeconds, self.lifelinesUsed.contains(.TenSeconds), onLifelineTapped)
        }
    }
    
    private func onLifelineTapped(_ lifeline:Lifeline) {
        
        // check if the lifetime has been used
        guard !self.lifelinesUsed.contains(lifeline) else {
            return
        }
        
        self.lifelinesUsed = self.lifelinesUsed.union(lifeline)
        onLifelineSelected(lifeline)
    }
}

struct LifelinePanel_Previews: PreviewProvider {
    static var previews: some View {
        LifelinePanel(.constant(.None)) { _ in
            
        }
    }
}
