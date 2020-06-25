//
//  Lunch_PlacesApp.swift
//  WatchLunchPlaces WatchKit Extension
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI

@main
struct Lunch_PlacesApp: App {
    @StateObject var store = testStore
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
