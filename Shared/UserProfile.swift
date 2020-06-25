//
//  UserProfile.swift
//  Lunch Places
//
//  Created by Philip Krück on 25.06.20.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("username")
                Spacer()
            }
            .padding()
            
            Spacer()
            Text("User Settings")
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
