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
                LunchPlacesList()
            }
            .tabItem {
                Label("Places", systemImage: "list.bullet")
            }
            .tag(Tab.menu)
            
            NavigationView {
                FavoriteLunchPlacesList()
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
            .tag(Tab.today)
            
            NavigationView {
                UserProfile()
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
            .tag(Tab.profile)
        }
    }
}

// MARK: - Tab

extension AppTabNavigation {
    enum Tab {
        case menu
        case favorites
        case today
        case profile
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
