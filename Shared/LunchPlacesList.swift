//
//  LunchPlacesList.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchCellView: View {
    var lunchPlace: LunchPlace
    
    var body: some View {
        NavigationLink(destination: LunchPlaceDetail(lunchPlace: lunchPlace)) {
            Image(systemName: "pencil")
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.purple)
                .cornerRadius(8)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(lunchPlace.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Distance to place")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                
            }
        }
    }
}

struct LunchPlacesList: View {
    @ObservedObject var store: LunchPlaceStore
    
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
            EditButton()
            #endif
            Button("Add", action: addLunchPlace)
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
        LunchPlacesList(store: testStore)
    }
}
