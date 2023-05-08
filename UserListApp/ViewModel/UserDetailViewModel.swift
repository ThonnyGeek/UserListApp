//
//  UserDetailViewModel.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import SwiftUI

final class UserDetailViewModel: ObservableObject {
    
    //MARK: init
    init(presentedItem: Binding<Bool>, userListService: UserListService) {
        self.userListService = userListService
        _presentedItem = presentedItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showProgressView = false
        }
    }
    
    //MARK: Variables
    @Binding var presentedItem: Bool
    @Published var showProgressView: Bool = true
    
    //MARK: Constants
    let text: String = "Example variable"
    let userListService: UserListService
    
    //MARK: Functions
    func sheetAction() {
        self.presentedItem = false
    }
}
