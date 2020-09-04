//
//  Concentration.swift
//  Concentration
//
//  Created by MacBook15 on 2020/9/2.
//  Copyright © 2020 MacBook15. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var onlyOneChoosenCardIndex: Int?
    
    func chooseCard(at index: Int) {
        if cards[index].isMatched {
            return
        }
        print("\(cards[index]) and \(onlyOneChoosenCardIndex ?? -1)")
        if let matchIndex = onlyOneChoosenCardIndex {
            // one card already face up
            if cards[matchIndex].identifier == cards[index].identifier, index != matchIndex {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = !cards[index].isFaceUp
            onlyOneChoosenCardIndex = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            cards[index].isFaceUp = true
            onlyOneChoosenCardIndex = index
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // Shuffle the cards
        for index in cards.indices {
            let otherCardIndex = arc4random_uniform(UInt32(cards.count))
            // swap cards
            cards.swapAt(index, Int(otherCardIndex))
        }
    }
}
