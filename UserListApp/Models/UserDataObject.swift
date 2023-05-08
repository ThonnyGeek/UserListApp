//
//  UserDataObject.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation

class UserDataObject: ObservableObject {
    static var shared: UserDataObject = UserDataObject()
    @Published var user: User?
    @Published var thumbnailURL: String?
}

