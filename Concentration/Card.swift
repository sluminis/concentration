//
//  Card.swift
//  Concentration
//
//  Created by MacBook15 on 2020/9/2.
//  Copyright © 2020 MacBook15. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int = getUniqueIdentifier()
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
