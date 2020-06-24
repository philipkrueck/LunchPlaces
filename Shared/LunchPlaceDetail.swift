//
//  LunchPlaceDetail.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI

struct LunchPlaceDetail: View {
    var lunchPlace: LunchPlace
    
    var body: some View {
        VStack {
            Text(lunchPlace.name)
        }
        .navigationTitle(lunchPlace.name)
    }
}

struct LunchPlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LunchPlaceDetail(lunchPlace: testData[0])
        }
    }
}
