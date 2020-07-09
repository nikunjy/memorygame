//
//  EmojiMemoryGame.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/8/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI
class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = [
            "👻",
            "🕷",
            "👽",
            "💀",
        ];
        
        return MemoryGame<String>(numPairs: emojis.count) { index  in
            return emojis[index]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
