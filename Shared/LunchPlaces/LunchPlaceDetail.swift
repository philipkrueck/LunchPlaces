//
//  LunchPlaceDetail.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchPlaceDetail: View {
    var lunchPlace: LunchPlace
    
    var body: some View {
        Group {
            #if os(iOS)
            container
            #else
            container
                .frame(minWidth: 500, idealWidth: 700, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
            #endif
        }
        .navigationTitle(lunchPlace.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    // ToDo: Toggle lunch place
                    print("toggling lunch place")
                }) {
                    Label("Favorite", systemImage: lunchPlace.isFavorite ? "heart.fill" : "heart")
                        .labelStyle(IconOnlyLabelStyle())
                }
            }
        }
    }
    
    var container: some View {
        VStack {
            Text(lunchPlace.name)
        }
    }
}

struct LunchPlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LunchPlaceDetail(lunchPlace: testData[0])
        }
    }
}
