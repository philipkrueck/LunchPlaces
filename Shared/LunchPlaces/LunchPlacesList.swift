//
//  LunchPlacesList.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchPlacesList: View {
    @EnvironmentObject private var store: LunchPlaceStore
    @State private var isShowingMapSheet = false
    
    @ViewBuilder var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 270, idealWidth: 300, maxWidth: 400, maxHeight: .infinity)
        #endif
    }
    
    var content: some View {
        List() {
            ForEach(store.lunchPlaces) { lunchPlace in
                NavigationLink(destination: LunchPlaceDetail(region: .constant(lunchPlace.coordinateRegion), lunchPlace: lunchPlace)) {
                    LunchPlaceRow(lunchPlace: lunchPlace)
                }
                .tag(lunchPlace)
            }
            .onMove(perform: moveLunchPlace)
            .onDelete(perform: deleteSandwiches)
            
            if !store.lunchPlaces.isEmpty {
                HStack {
                    Spacer()
                    Text("\(store.lunchPlaces.count) Lunch Place\(store.lunchPlaces.count > 1 ? "s" : "")")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $isShowingMapSheet) {
            LunchPlaceSelectionMap()
                .environmentObject(store)
        }
        .navigationTitle("Lunch Places")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                        isShowingMapSheet.toggle()
                }){
                    Label("Add", systemImage: "plus")
                        .labelStyle(IconOnlyLabelStyle())
                }
            }
        }
    }
    
    func moveLunchPlace(from indexSet: IndexSet, to offset: Int) {
        withAnimation {
            store.moveLunchPlace(from: indexSet, to: offset)
        }
    }
    
    func deleteSandwiches(at offsets: IndexSet) {
        withAnimation {
            store.removeLunchPlace(at: offsets)
        }
    }
}

struct LunchPlacesList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LunchPlacesList()
        }
    }
}
