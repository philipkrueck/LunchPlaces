//
//  Lunch_PlacesApp.swift
//  Shared
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

@main
struct Lunch_PlacesApp: App {
    @StateObject var store = LunchPlaceStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
