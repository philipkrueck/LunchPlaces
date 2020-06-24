//
//  LunchPlace.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import Combine
import Foundation

struct LunchPlace: Identifiable {
    let id = UUID()
    var name: String
    var isFavorite: Bool
}

let testData = [
    LunchPlace(name: "Subway", isFavorite: true),
    LunchPlace(name: "Dominos", isFavorite: false),
    LunchPlace(name: "2 Türen Italiener", isFavorite: true),
    LunchPlace(name: "Stadtsalat", isFavorite: false),
    LunchPlace(name: "Edelcurry", isFavorite: false)
]
