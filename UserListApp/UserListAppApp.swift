//
//  UserListAppApp.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import SwiftUI

@main
struct UserListAppApp: App {
    
    @State var userDataObject: UserDataObject = UserDataObject()
    @State var networkError: NetworkError = NetworkError()
    
    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: UserListViewModel(userListService: UserListService()))
                .environmentObject(userDataObject)
                .environmentObject(networkError)
        }
    }
}
