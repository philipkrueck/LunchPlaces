//
//  LunchPlacesList.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchPlacesList: View {
    @EnvironmentObject private var store: LunchPlaceStore
    @State private var selection: LunchPlace?
    
    @ViewBuilder var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 270, idealWidth: 300, maxWidth: 400, maxHeight: .infinity)
        #endif
    }
    
    var content: some View {
        List(selection: $selection) {
            ForEach(store.lunchPlaces) { lunchPlace in
                NavigationLink(destination: LunchPlaceDetail(lunchPlace: lunchPlace), tag: lunchPlace, selection: $selection) {
                    LunchPlaceRow(lunchPlace: lunchPlace)
                }
                .tag(lunchPlace)
                // ToDo: add onReceive
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
            store.addLunchPlace(LunchPlace(name: "Grieche", isFavorite: true, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "turtlerock_feature", address: .testAddress))
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
            LunchPlacesList()
        }
    }
}