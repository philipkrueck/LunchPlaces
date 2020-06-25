//
//  LunchPlacesList.swift
//  Lunch Places
//
//  Created by Philip Krück on 24.06.20.
//

import SwiftUI
import MapKit

struct LunchPlaceRow: View {
    var lunchPlace: LunchPlace
    
    var size: CGFloat {
        #if os(iOS)
        return 96
        #else
        return 60
        #endif
    }
    
    var cornerRadius: CGFloat {
        #if os(iOS)
        return 16
        #else
        return 8
        #endif
    }
    
    var verticalRowPadding: CGFloat {
        #if os(macOS)
        return 10
        #else
        return 0
        #endif
    }
    
    var verticalTextPadding: CGFloat {
        #if os(iOS)
        return 8
        #else
        return 0
        #endif
    }
    
    var body: some View {
        HStack(alignment: .top) {
            lunchPlace.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            
            VStack(alignment: .leading) {
                Text(lunchPlace.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("Distance to place")
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, verticalRowPadding)
            
            Spacer(minLength: 0)
        }
        .font(.subheadline)
        .padding(.vertical, verticalRowPadding)
    }
}

struct LunchPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        LunchPlaceRow(lunchPlace: testData[0])
    }
}
