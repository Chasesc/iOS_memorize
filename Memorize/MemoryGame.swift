//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chase Schelthoff on 7/3/20.
//  Copyright © 2020 Chase Schelthoff. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2,     content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
