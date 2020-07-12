//
//  ArrayExtensions.swift
//  helloworld
//
//  Created by Nikunj Yadav on 7/10/20.
//  Copyright © 2020 Nikunj Yadav. All rights reserved.
//

import Foundation
extension Array where Element: Identifiable {
    //  Int? is an optional, it can take the actual value
    // or be nil
    func firstIndex(_ of: Element) -> Int?  {
        for idx in 0..<self.count {
            if self[idx].id == of.id {
                return idx
            }
        }
        return nil
    }
}
