//
//  ContentView.swift
//  Shared
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchCellView: View {
    var lunchPlace: LunchPlace
    
    var body: some View {
        NavigationLink(destination: LunchPlaceDetail(lunchPlace: lunchPlace)) {
            Image(systemName: "pencil")
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(lunchPlace.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Distance to place")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var store: LunchPlaceStore
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(store.lunchPlaces) { lunchPlace in
                    LunchCellView(lunchPlace: lunchPlace)
                }
                .onMove(perform: moveLunchPlace)
                .onDelete(perform: deleteSandwiches)
                
                if !store.lunchPlaces.isEmpty {
                    HStack {
                        Spacer()
                        Text("\(store.lunchPlaces.count) Lunch Place\(store.lunchPlaces.count > 1 ? "s" : "")")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Lunch Places")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: addLunchPlace)
            }
            
            Text("Select a Lunch Place")
                .font(.largeTitle)
        }
    }
    
    func addLunchPlace() {
        withAnimation {
            store.addLunchPlace(LunchPlace(name: "Grieche", isFavorite: true))
        }
    }
    
    func moveLunchPlace(from indexSet: IndexSet, to offset: Int) {
        withAnimation {
            store.moveLunchPlace(from: indexSet, to: offset)
        }
    }
    
    func deleteSandwiches(at offsets: IndexSet) {
        withAnimation {
            store.removeLunchPlace(at: offsets)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
        }
    }
}
