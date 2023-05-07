//
//  UserListService.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import Combine

protocol UserListServiceProtocol {
    func getUserListData() -> AnyPublisher<UserInfo, Never>
}

class UserListService: UserListServiceProtocol {
    func getUserListData() -> AnyPublisher<UserInfo, Never> {
        //
    }
}
