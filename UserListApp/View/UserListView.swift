//
//  ContentView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .padding()
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone SE (3rd generation)")
                .environment(\.locale, .init(identifier: "es"))
            
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
                .environment(\.locale, .init(identifier: "es"))
            
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
                .previewDisplayName("iPhone 14 Pro Max")
                .environment(\.locale, .init(identifier: "es"))
            
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
                .previewDisplayName("iPad (10th generation)")
                .environment(\.locale, .init(identifier: "es"))
        }
    }
}
