//
//  Grid.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/10/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item:Identifiable, ItemView: View {
    var items: Array<Item>
    var viewForItem: (Item) -> ItemView
    
    // Declaring a function as escaping means tells the compiler
    // that this function is not going to be executed right away
    // and it will be used later at some point.
    // This is because this tells the compiler that references
    init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(size: geometry.size)
        }
    }
    
    func body(size: CGSize) -> some View {
        let layout = GridLayout(itemCount: self.items.count, in: size)
        return ForEach(items) { item in
            self.body(item, layout: layout)
        }
    }
    
    func body(_ item: Item, layout: GridLayout) -> some View {
        // Body for an item takes an item and calls viewForItem() which renders the view
        // .frame offers a specific size to the view.
        // Grid layout here is giving us the width, height and the position
        viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: items.firstIndex(item)!))
    }
}
