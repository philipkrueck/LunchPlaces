//
//  OpenMapButton.swift
//  Lunch Places
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI
import MapKit

struct OpenMapButton: View {
    let lunchPlace: LunchPlace
    
    var body: some View {
        Button {
            let destination = MKMapItem(placemark: MKPlacemark(coordinate: lunchPlace.locationCoordinate))
            destination.name = lunchPlace.name
            destination.openInMaps()
        } label: {
            #if os(iOS)
            Text("Open in Maps")
                .padding()
                .foregroundColor(.white)
                .font(.headline)
                .background(Color.accentColor)
                .cornerRadius(8)
                .shadow(radius: 12)
            #else
            Text("Open in Maps")
            #endif
        }
    }
}

struct OpenMapButton_Previews: PreviewProvider {
    static var previews: some View {
        OpenMapButton(lunchPlace: testData[0])
    }
}
