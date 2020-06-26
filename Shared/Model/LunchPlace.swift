//
//  LunchPlace.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import Combine
import Foundation
import MapKit
import SwiftUI

struct LunchPlace: Identifiable, Hashable, Equatable {
    static func == (lhs: LunchPlace, rhs: LunchPlace) -> Bool {
        return lhs.name == rhs.name &&
            lhs.isFavorite == rhs.isFavorite &&
            lhs.coordinates == rhs.coordinates &&
            lhs.imageName == rhs.imageName &&
            lhs.address == rhs.address
        
    }
    
    let id = UUID()
    var name: String
    var isFavorite: Bool
    var coordinates: Coordinates
    var imageName: String
    var address: Address
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
}

extension LunchPlace {
    
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
    
    var coordinateRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Address: Identifiable, Hashable {
    let id = UUID()
    let streetName: String
    let houseNumber: String
    let postalCode: String
    let city: String
}


// MARK: - Test Data

let subwayAddress: Address = .init(streetName: "Neustädter Str.", houseNumber: "27", postalCode: "20355", city: "Hamburg")
let dominosAddress: Address = .init(streetName: "Valentinskamp", houseNumber: "30", postalCode: "20355", city: "Hamburg")
let stadtSalatAddress: Address = .init(streetName: "Große Theaterstraße", houseNumber: "31-35", postalCode: "20355", city: "Hamburg")
let deanAndDavidAddress: Address = .init(streetName: "Ballindamm", houseNumber: "40", postalCode: "20095", city: "Hamburg")
let edelCurryAddress: Address = .init(streetName: "Große Bleichen", houseNumber: "68", postalCode: "20354", city: "Hamburg")


let testData = [
    LunchPlace(name: "Subway", isFavorite: true, coordinates: Coordinates(latitude: 53.553330, longitude: 9.983250), imageName: "subway", address: subwayAddress),
    LunchPlace(name: "Dominos", isFavorite: false, coordinates: Coordinates(latitude: 53.555530, longitude: 9.983580), imageName: "dominos", address: dominosAddress),
    LunchPlace(name: "Stadtsalat", isFavorite: true, coordinates: Coordinates(latitude: 53.556910, longitude: 9.989160), imageName: "stadtsalat", address: stadtSalatAddress),
    LunchPlace(name: "Dean & David", isFavorite: false, coordinates: Coordinates(latitude: 53.551819, longitude: 9.995330), imageName: "deananddavid", address: deanAndDavidAddress),
    LunchPlace(name: "Edelcurry", isFavorite: false, coordinates: Coordinates(latitude: 53.552259, longitude: 9.986248), imageName: "edelcurry", address: edelCurryAddress)
]


