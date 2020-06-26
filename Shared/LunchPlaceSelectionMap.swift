//
//  LunchPlaceSelectionMap.swift
//  Lunch Places
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI
import MapKit

extension Int: Identifiable {
    public var id: Int { self }
}

struct CustomMapAnnotation: View {
    let mapItem: MKMapItem
    let completion: (MKMapItem) -> Void
    
    var body: some View {
        Image("fork")
            .resizable()
            .frame(width: 30, height: 30)
            .accentColor(.accentColor)
            .foregroundColor(.accentColor)
            .onTapGesture {
                completion(mapItem)
            }
    }
}

struct LunchPlaceSelectionMap: View {
    @EnvironmentObject private var store: LunchPlaceStore
    @Environment(\.presentationMode) var presentationMode
    
    @State var region: MKCoordinateRegion = testData[0].coordinateRegion
    
    @State private var mapMarkers: [MapAnnotation<CustomMapAnnotation>] = []
    @State private var selectedPlaceMark: MKPlacemark?
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: mapMarkers.indices) { index in
                mapMarkers[index]
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Select Lunch Place")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    Spacer()
                }
                .padding(.vertical)
             
                Spacer()
                
                if let selectedPlaceMark = selectedPlaceMark {
                    Button {
                        let coordinates = Coordinates(latitude: selectedPlaceMark.coordinate.latitude, longitude: selectedPlaceMark.coordinate.longitude)
                        let lunchPlace = LunchPlace(name: selectedPlaceMark.name ?? "", isFavorite: false, coordinates: coordinates, imageName: "meal", address: subwayAddress)
                        withAnimation {
                            self.store.addLunchPlace(lunchPlace)
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Add \"\(selectedPlaceMark.name!)\" to Lunch Places")
                            .padding()
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                            .shadow(radius: 12)
                    }
                    .padding(.bottom)
                }
            }
        }
        .onAppear {
            findBars { response in
                guard let response = response else {
                    print("No response")
                    return
                }
                region = response.boundingRegion
                
                let mapMarkers: [MapAnnotation<CustomMapAnnotation>] = response.mapItems.map { mapItem in
                    MapAnnotation(coordinate: mapItem.placemark.coordinate, anchorPoint: .zero) {
                        CustomMapAnnotation(mapItem: mapItem) { item in
                            selectedPlaceMark = item.placemark
                        }
                    }
                }
                
                self.mapMarkers = mapMarkers
            }
        }
    }

    // MARK: - Map stuff
    
    func findBars(completion: @escaping (MKLocalSearch.Response?) -> ()) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.pointOfInterestFilter = MKPointOfInterestFilter(including: [.restaurant])
        searchRequest.region = region
        searchRequest.resultTypes = .pointOfInterest
        
        let localSearch = MKLocalSearch(request: searchRequest)
        localSearch.start { (response, _) in
            completion(response)
        }
      }
    
      func set(places: [MKMapItem]) {
        for place in places {
          let placemark = place.placemark
          let annotation = MKPointAnnotation()
          annotation.coordinate = placemark.coordinate
          annotation.title = placemark.name
//          mapView.addAnnotation(annotation)
        }
      }
}

struct LunchPlaceSelectionMap_Previews: PreviewProvider {
    static var previews: some View {
        LunchPlaceSelectionMap()
    }
}
