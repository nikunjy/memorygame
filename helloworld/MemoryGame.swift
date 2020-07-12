//
//  MemoryGame.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/8/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//
import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    private var scoreNum = 0
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
    
    // Another optional it can be nil or a value
    var lastChosenIndex: Int?
    
    mutating func choose(card: Card) {
        let idx = cards.firstIndex(card)!
        
        if cards[idx].isFaceUp || cards[idx].isMatched {
            return
        }
        
        reset()
        cards[idx].faceup()
        if lastChosenIndex == nil {
            lastChosenIndex = idx
            return
        }
        
        let last  = lastChosenIndex!
        if cards[last].content == cards[idx].content {
            cards[last].isMatched = true
            cards[idx].isMatched = true
            scoreNum += 2
        } else {
            scoreNum -= 1
        }
        cards[last].faceup()
        lastChosenIndex = nil
    }
    
    func score() -> Int {
        self.scoreNum
    }
    
    mutating func reset() {
        cards = cards.map{card in
            card.reset()
        }
    }

    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        init(content: CardContent, id: Int) {
            self.content = content
            self.id = id
        }
        
        mutating func faceup() {
            self.isFaceUp = true
        }
        
        func reset() -> Card {
            var card = self
            if !card.isMatched {
                card.isFaceUp = false
            }
            return card
        }
        var id: Int
    }
}
