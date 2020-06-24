//
//  LunchPlacesList.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchPlaces: View {
    @EnvironmentObject private var store: LunchPlaceStore
    
    var body: some View {
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
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            #endif
            
            ToolbarItem(placement: .primaryAction) {
                Button(action: addLunchPlace){
                    Label("Add", systemImage: "plus")
                        .labelStyle(IconOnlyLabelStyle())
                }
            }
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

struct LunchPlacesList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LunchPlaces()
        }
    }
}
