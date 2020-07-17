//
//  Cardify.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/14/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI
struct Cardify: AnimatableModifier {
    var rotation: Double
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    var isFaceUp: Bool {
        rotation < 90
    }
    
    // This makes it explicity to the animation system
    // that you don't need to bother about animating on your own
    // but instead I am telling you what value is moving
    var animatableData: Double {
        get { rotation}
        set { rotation = newValue}
    }
    
    // ViewModifier gives you acess to this thing called content
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    let cornerRadius: CGFloat = 10.0
    let edgeWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
