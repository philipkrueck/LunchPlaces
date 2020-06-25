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
                if selection == .favorites {
                    Label("Favorites", systemImage: "heart.fill")
                } else {
                    Label("Favorites", systemImage: "heart")
                }
            }
            .tag(Tab.favorites)
            
            NavigationView {
                Text("Today")
            }
            .tabItem {
                if selection == .today {
                    Label("Today", systemImage: "capsule.fill")
                } else {
                    Label("Today", systemImage: "capsule")
                }
            }
            .tag(Tab.today)
            
            NavigationView {
                UserProfile()
            }
            .tabItem {
                if selection == .today {
                    Label("Profile", systemImage: "person.crop.circle")
                } else {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
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
