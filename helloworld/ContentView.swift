//
//  ContentView.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/7/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var game = EmojiMemoryGame()
    var body: some View {
        HStack{
            ForEach(game.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    self.game.choose(card: card)
                })
            }
        }
        .padding()
        .aspectRatio(5/3, contentMode: ContentMode.fit)
        .font(Font.largeTitle)
        .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
