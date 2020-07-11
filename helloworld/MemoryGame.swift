//
//  MemoryGame.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/8/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//
import Foundation
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    init(numPairs: Int, factory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numPairs {
            cards.append(
                Card(content: factory(pairIndex), id: pairIndex * 2)
            )
            cards.append(
                Card(content: factory(pairIndex), id: pairIndex * 2 + 1)
            )
        }
        cards = cards.shuffled()
    }
    
    func indexOf(_ card: Card) -> Int {
        for pairIndex in 0..<cards.count {
            if cards[pairIndex].id == card.id {
                return pairIndex
            }
        }
        return 0
    }
    
    mutating func choose(card: Card) {
        cards[indexOf(card)].isFaceUp = !cards[indexOf(card)].isFaceUp
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        init(content: CardContent, id: Int) {
            self.content = content
            self.id = id
        }
        var id: Int
    }
}
