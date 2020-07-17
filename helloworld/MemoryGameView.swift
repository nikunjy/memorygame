//
//  ContentView.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/7/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    init(theme: Theme) {
        game = EmojiMemoryGame(theme: theme)
    }
    
    var body: some View {
        VStack{
            HStack{
                Button(action:self.chooseTheme){
                    Text("New Game")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                }
                Text("Score : \(game.score())").padding().overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                )
            }
            if !game.isFinished() {
                Grid(items: game.cards) { card in
                    CardView(card: card).onTapGesture(perform: {
                        // Explicity animation on tapping
                        // Slow down the duration
                        withAnimation(.linear(duration: 0.5)) {
                            self.game.choose(card: card)
                        }
                    })
                        .padding()
                        .foregroundColor(self.game.cardColor())
                }
            } else {
                Text("🥂").font(.largeTitle).transition(.scale).animation(.linear(duration: 2))
            }
        }
    }
    
    func fontSize(_ size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
    
    let fontScaleFactor : CGFloat = 0.20
    
    func chooseTheme() {
        let theme = Themes.random()
        game.reset(theme: theme)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            self.render(size: geometry.size)
        }
    }
    
    @State private var bonusRemaining: Double = 1
    
    private func startBonusTimeRemaining() {
        bonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            bonusRemaining = 0
        }
    }
    
    @ViewBuilder
    func render(size: CGSize) -> some View {
        ZStack {
            Group {
                if card.isConsumingBonusTime{
                    Pie(
                        startAngle: Angle.degrees(-90),
                        endAngle: Angle.degrees(-bonusRemaining * 360-90),
                        clockWise: true
                    ).onAppear{
                        self.startBonusTimeRemaining()
                    }
                } else {
                    Pie(
                        startAngle: Angle.degrees(-90),
                        endAngle: Angle.degrees(-card.bonusRemaining * 360-90),
                        clockWise: true
                    )
                }
            }.padding(3).opacity(0.25)
            Text(card.content)
        }.cardify(isFaceUp: card.isFaceUp)
            .font(Font.system(size: fontSize(size)))
    }
    
    func fontSize(_ size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
    
    let fontScaleFactor : CGFloat = 0.65
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let view = MemoryGameView(theme: Halloween())
        view.game.choose(card: view.game.cards[0])
        return view
    }
}
