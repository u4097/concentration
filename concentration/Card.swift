//
//  Card.swift
//  concentration
//
//  Created by Oleg Sitnikov on 01.01.2020.
//  Copyright © 2020 Oleg Sitnikov. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
   private static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // TODO: Shuffle the cards
}
