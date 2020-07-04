//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chase Schelthoff on 7/3/20.
//  Copyright © 2020 Chase Schelthoff. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intents(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
