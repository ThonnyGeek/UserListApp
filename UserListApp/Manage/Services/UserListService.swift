//
//  UserListService.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

protocol UserListServiceProtocol {
    func getUserListData() -> AnyPublisher<[User]?, Never>
    func getPhotosData() -> AnyPublisher<[PhotosDatum]?, Never>
}

class UserListService: UserListServiceProtocol {
    
    @EnvironmentObject var networkError: NetworkError
    
    func getUserListData() -> AnyPublisher<[User]?, Never> {
        let request = AF.request(UserListRouter.getUsersData)
        let timeoutInterval: TimeInterval = 5
        DispatchQueue.main.asyncAfter(deadline: .now() + timeoutInterval) {
            if request.task?.state == .running {
                request.cancel()
                self.networkError.isNetworkError = true
                print("La solicitud ha tardado más de \(timeoutInterval) segundos.")
            }
        }
        return request.publishDecodable(type: [User].self)
            .compactMap { result in
                guard let result = result.value._unbox else {
                    return nil
                }
                return result
            }
            .eraseToAnyPublisher()
    }
    
    func getPhotosData() -> AnyPublisher<[PhotosDatum]?, Never> {
        return AF.request(UserListRouter.getPhotos).publishDecodable(type: [PhotosDatum].self)
            .compactMap { result in
                guard let result = result.value._unbox else {
                    return nil
                }
                return result
            }
            .eraseToAnyPublisher()
    }
}

