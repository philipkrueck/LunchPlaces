//
//  Favorites.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct FavoriteLunchPlacesList: View {
    @EnvironmentObject var store: LunchPlaceStore
    @State private var selection: LunchPlace?
    
    @ViewBuilder var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 270, idealWidth: 300, maxWidth: 400, maxHeight: .infinity)
            .toolbar { Spacer() }
        #endif
    }
    
    var content: some View {
        List(selection: $selection) {
            ForEach(store.favoriteLunchPlaces) { lunchPlace in
                NavigationLink(destination: LunchPlaceDetail(region: .constant(lunchPlace.coordinateRegion), lunchPlace: lunchPlace), tag: lunchPlace, selection: $selection) {
                    LunchPlaceRow(lunchPlace: lunchPlace)
                }
                .tag(lunchPlace)
                // ToDo: add onReceive
            }
            
            if !store.favoriteLunchPlaces.isEmpty {
                HStack {
                    Spacer()
                    Text("\(store.favoriteLunchPlaces.count) Favorite\(store.lunchPlaces.count > 1 ? "s" : "")")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .navigationTitle("Favorite Places")
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLunchPlacesList()
    }
}




