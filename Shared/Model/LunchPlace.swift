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
    
    static let testAddress: Address = .init(streetName: "Hainbuchenweg", houseNumber: "4", postalCode: "22299", city: "Hamburg")
}

let testData = [
    LunchPlace(name: "Subway", isFavorite: true, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "charleyrivers_feature", address: .testAddress),
    LunchPlace(name: "Dominos", isFavorite: false, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "chilkoottrail", address: .testAddress),
    LunchPlace(name: "2 Türen Italiener", isFavorite: true, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "stmarylake_feature", address: .testAddress),
    LunchPlace(name: "Stadtsalat", isFavorite: false, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "stmarylake_feature", address: .testAddress),
    LunchPlace(name: "Edelcurry", isFavorite: false, coordinates: Coordinates(latitude: 10, longitude: 10), imageName: "turtlerock_feature", address: .testAddress)
]
