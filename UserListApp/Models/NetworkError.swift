//
//  NetworkError.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation

class NetworkError: ObservableObject {
    static var shared: NetworkError = NetworkError()
    @Published var isNetworkError: Bool?
}
