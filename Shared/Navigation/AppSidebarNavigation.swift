//
//  AppSidebarNavigation.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct AppSidebarNavigation: View {
    
    enum NavigationItem {
        case menu
        case favorites
        case today
    }
    
    @State private var selection: Set<NavigationItem> = [.menu]
    @State private var presentingProfile = false
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: LunchPlacesList()) {
                Label("Places", systemImage: "list.bullet")
            }
            .tag(NavigationItem.menu)
            
            NavigationLink(destination: FavoriteLunchPlacesList()) {
                Label("Favorites", systemImage: "heart.fill")
            }
            .tag(NavigationItem.favorites)
            
            NavigationLink(destination: Text("Today")) {
                Label("Today", systemImage: "capsule.fill")
            }
            .tag(NavigationItem.today)
        }
        .overlay(Pocket(presentingProfile: $presentingProfile), alignment: .bottom)
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            #if os(macOS)
            sidebar.frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            #else
            sidebar
            #endif
            
            Text("Content List")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            #if os(macOS)
            Text("Select a Lunch Place")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar { Spacer() }
            #else
            Text("Select a Lunch Place")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
    }
    
    struct Pocket: View {
        @Binding var presentingProfile: Bool
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                Button(action: { presentingProfile = true }, label: {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
                    .padding(6)
                    .contentShape(Rectangle())
                })
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .buttonStyle(PlainButtonStyle())
            }
            .sheet(isPresented: $presentingProfile) {
                Text("Showing User Profile")
            }
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
