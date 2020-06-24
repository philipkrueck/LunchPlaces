//
//  Favorites.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct FavoriteLunchPlaces: View {
    @EnvironmentObject var store: LunchPlaceStore
    
    private var favoriteLunchPlaces: [LunchPlace] {
        store.lunchPlaces.filter { $0.isFavorite }
    }
    
    var body: some View {
        List() {
            ForEach(favoriteLunchPlaces) { lunchPlace in
                LunchCellView(lunchPlace: lunchPlace)
            }
            
            if !favoriteLunchPlaces.isEmpty {
                HStack {
                    Spacer()
                    Text("\(favoriteLunchPlaces.count) Favorite\(store.lunchPlaces.count > 1 ? "s" : "")")
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
        FavoriteLunchPlaces()
    }
}
