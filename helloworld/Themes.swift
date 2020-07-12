//
//  Themes.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/11/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import Foundation
import SwiftUI

protocol Theme {
    func emojis() -> [String]
    func name() -> String
    func cardColor() -> Color
}

struct Halloween: Theme {
    func emojis() -> [String] {
        [ "👻", "🕷", "👽", "💀", "👹", "🧚🏼‍♀️"]
    }
    func name() -> String {
        "halloween"
    }
    func cardColor() -> Color {
        Color.orange
    }
}

struct Smiles: Theme {
    func emojis() -> [String] {
        ["😀", "😄", "😁", "😆", "😅", "😂", "🤣"];
    }
    
    func name() -> String {
        "smileys"
    }
    func cardColor() -> Color {
        Color.purple
    }
}

struct Naughty: Theme {
    func emojis() -> [String] {
        ["😈", "💋", "👄", "👅", "🍆", "🍑", "🍷"];
    }
    func name() -> String {
        "naughty"
    }
    func cardColor() -> Color {
        Color.pink
    }
}

struct Themes {
    static let all: Array<Theme> = [
        Halloween(),
        Smiles(),
        Naughty(),
    ];
    
    
    static func random() -> Theme {
        let idx = Int.random(in: 0..<all.count)
        return all[idx]
    }
}
