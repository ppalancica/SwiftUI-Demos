//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Pavel Palancica on 3/20/22.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandiches: [Sandwich] = []) {
        self.sandwiches = sandiches
    }
}

let testStore = SandwichStore(sandiches: testData)
