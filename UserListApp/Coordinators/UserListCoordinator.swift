//
//  UserListCoordinator.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import SwiftUI

enum UserListViewLink: Hashable, Identifiable {
case link
    
    var id: String {
        String(describing: self)
    }
}

struct UserListCoordinator<Content: View>: View {
    
    @ObservedObject var state: UserListViewModel
    let content: () -> Content
    
    var body: some View {
        NavigationStack(path: $state.coverPath) {
            content()
                .sheet(isPresented: $state.presentedItem, content: sheetContent)
        }
    }
    
    @ViewBuilder private func sheetContent() -> some View {
        UserDetailView(viewModel: UserDetailViewModel(presentedItem: $state.presentedItem, userListService: UserListService()))
            .presentationDetents([.height(Sizes.height * 0.7)])
    }
}
