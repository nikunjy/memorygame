//
//  EmojiMemoryGame.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/8/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI
class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>;
    @Published private var theme: Theme
    init(theme: Theme) {
        game = EmojiMemoryGame.createMemoryGame(emojis: theme.emojis())
        self.theme = theme
    }
    
    static func createMemoryGame(emojis: [String]) -> MemoryGame<String> {
        let numPairs = Int.random(in: 3 ..< emojis.count)
        //let numPairs = 3
        return MemoryGame<String>(numPairs: numPairs) { index  in
            return emojis[index]
        }
    }
    
    func reset(theme: Theme) {
        game = EmojiMemoryGame.createMemoryGame(emojis: theme.emojis())
        self.theme = theme
    }
    
    func cardColor() -> Color {
        theme.cardColor()
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    func score() -> Int {
        return game.score()
    }
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func isFinished() -> Bool {
        return game.isFinished
    }
}
