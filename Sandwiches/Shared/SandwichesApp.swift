//
//  SandwichesApp.swift
//  Shared
//
//  Created by Pavel Palancica on 3/10/22.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
