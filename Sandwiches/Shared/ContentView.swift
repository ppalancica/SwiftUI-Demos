//
//  ContentView.swift
//  Shared
//
//  Created by Pavel Palancica on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSanwiches)
                .onDelete(perform: deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
//            .toolbar {
////                #if os(iOS)
////                EditButton()
////                #endif
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    #if os(iOS)
//                    EditButton()
//                    #endif
//                }
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    Button("Add", action: makeSandwich)
//                }
//            }
//            .navigationBarItems(
//                leading: HStack { EditButton() },
//                trailing: HStack { Button("Add", action: makeSandwich) }
//            )
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button("Add", action: makeSandwich)
            )
    
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSanwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}
/*struct ContentView: View {
    var sandwiches: [Sandwich] = []
//    @StateObject private var store = SandwichStore()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                
                HStack {
                    Spacer()
                    Text("\(sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            
            Text("Select a sandwich")
                .font(.largeTitle)
        }
        
//        NavigationView {
//            List(sandwiches) { sandwich in
//                SandwichCell(sandwich: sandwich)
//            }
//            .navigationTitle("Sandwiches")
//        }
    }
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView(sandwiches: testData)
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
//        NavigationLink(destination: Text(sandwich.name)) {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                Image(sandwich.imageName) // Image(systemName: "photo")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
