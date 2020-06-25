//
//  WatchLunchPlacesList.swift
//  WatchLunchPlaces WatchKit Extension
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI

struct WatchLunchPlacesList: View {
    @EnvironmentObject private var store: LunchPlaceStore
    
    var body: some View {
        List() {
            ForEach(store.lunchPlaces) { lunchPlace in
                HStack(alignment: .center) {
                    lunchPlace.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text(lunchPlace.name)
                            .font(.headline)
                            .lineLimit(1)
                        Text("5 min")
                            .lineLimit(1)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical)
                    
                    Spacer(minLength: 0)

                }
            }
        }
    }
}

struct WatchLunchPlacesList_Previews: PreviewProvider {
    static var previews: some View {
        WatchLunchPlacesList()
    }
}
