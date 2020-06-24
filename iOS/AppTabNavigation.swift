//
//  AppTabNavigation.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct AppTabNavigation: View {
    
    @State private var selection: Tab = .menu
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                LunchPlaces()
            }
            .tabItem {
                Label("Places", systemImage: "list.bullet")
            }
            .tag(Tab.menu)
            
            NavigationView {
                FavoriteLunchPlaces()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            .tag(Tab.favorites)
            
            NavigationView {
                Text("Today")
            }
            .tabItem {
                Label("Today", systemImage: "capsule.fill")
            }
            .tag(Tab.rewards)
            
            NavigationView {
                Text("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
            .tag(Tab.recipes)
        }
    }
}

// MARK: - Tab

extension AppTabNavigation {
    enum Tab {
        case menu
        case favorites
        case rewards
        case recipes
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
