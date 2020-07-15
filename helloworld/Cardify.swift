//
//  Cardify.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/14/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI
struct Cardify: ViewModifier {
    var isFaceUp: Bool
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
        }
    }
    let cornerRadius: CGFloat = 10.0
    let edgeWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
