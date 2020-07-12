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
    
    // escaping means I don't know what is going to happen to this function
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
        viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: items.firstIndex(item)!))
    }
}
