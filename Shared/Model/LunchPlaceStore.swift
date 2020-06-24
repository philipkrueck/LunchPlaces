//
//  LunchPlaceStore.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import Combine
import Foundation

class LunchPlaceStore: ObservableObject {
    @Published private(set) var lunchPlaces: [LunchPlace]
    
    init(lunchPlaces: [LunchPlace] = []) {
        self.lunchPlaces = lunchPlaces
    }
    
    func addLunchPlace(_ lunchPlace: LunchPlace) {
        lunchPlaces.append(lunchPlace)
    }
    
    func moveLunchPlace(from indexSet: IndexSet, to offset: Int) {
        lunchPlaces.move(fromOffsets: indexSet, toOffset: offset)
    }
    
    func removeLunchPlace(at offsets: IndexSet) {
        lunchPlaces.remove(atOffsets: offsets)
    }
}

let testStore = LunchPlaceStore(lunchPlaces: testData)
