//
//  ContentView.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/7/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var game = EmojiMemoryGame()
    var body: some View {
        return HStack{
            ForEach(game.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    self.game.choose(card: card)
                })
            }
        }
        .aspectRatio(2/3, contentMode: ContentMode.fit)
        .padding()
        .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            self.render(size: geometry.size)
        }
    }
    
    func render(size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }.font(Font.system(size: fontSize(size)))
    }
    
    func fontSize(_ size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
    
    let fontScaleFactor : CGFloat = 0.75
    let cornerRadius: CGFloat = 10.0
    let edgeWidth: CGFloat = 3
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView()
    }
}
