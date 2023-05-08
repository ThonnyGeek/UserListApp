//
//  UserListViewModel.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import SwiftUI

final class UserListViewModel: ObservableObject {
    
    //MARK: init
    init(userListService: UserListService) {
        self.userListService = userListService
        fetchUserListData()
        fetchPhotosData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showProgressView = false
        }
    }
    
    //MARK: Variables
    @Published var coverPath = NavigationPath()
    @Published var presentedItem: Bool = false
    @Published var userInfoList: [User]?
    @Published var userInfoListExe: Bool = false
    @Published var userInfoListExe2: Bool = false
    @Published var photosDataList: [PhotosDatum]?
    @Published var isConnected: Bool = false
    @Published var showProgressView: Bool = true
    
    //MARK: Constants
    let text: String = "Example variable"
    let userListService: UserListService
    
    //MARK: Functions
    func fetchUserListData() {
        self.userInfoListExe2 = true
        self.userListService.getUserListData()
            .sink(receiveCompletion: Constants.onReceive) { userInfoListResponse in
                guard let userInfoListResponse = userInfoListResponse else { return }
                self.userInfoList = userInfoListResponse
                self.userInfoListExe = true
            }
            .store(in: &Constants.cancellables)
    }
    
    func fetchPhotosData() {
        self.userListService.getPhotosData()
            .sink(receiveCompletion: Constants.onReceive) { photosDataResponse in
                guard let photosDataResponse  = photosDataResponse else { return }
                self.photosDataList = photosDataResponse
            }
            .store(in: &Constants.cancellables)
    }
    
    //Buttons
    func didTapUserDetailButton() {
        presentedItem = true
    }
    
    func didTapRetryConnectionButton() {
        self.isConnected = true
        self.fetchUserListData()
        self.fetchPhotosData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isConnected = NetworkManager.isConnectedToNetwork()
        }
    }
}
