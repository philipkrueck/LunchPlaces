//
//  WatchLunchPlacesDetail.swift
//  WatchLunchPlaces WatchKit Extension
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI

struct WatchLunchPlacesDetail: View {
    var lunchPlace: LunchPlace
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(lunchPlace.name)
                        .font(.headline)
                        .bold()
                    Text("\(lunchPlace.address.streetName) \(lunchPlace.address.houseNumber)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    Text("\(lunchPlace.address.postalCode) \(lunchPlace.address.city)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Spacer()
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: lunchPlace.locationCoordinate))
                    destination.name = lunchPlace.name
                    destination.openInMaps()
                }
            }
        }
    }
}

struct WatchLunchPlacesDetail_Previews: PreviewProvider {
    static var previews: some View {
        WatchLunchPlacesDetail(lunchPlace: testData[0])
    }
}
