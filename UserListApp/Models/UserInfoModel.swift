//
//  UserInfoModel.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation

struct UserInfo {
    var userInfoElements: [UserInfoElement]?
}
// MARK: - UserInfoElement
struct UserInfoElement {
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
}

// MARK: - Address
struct Address {
    var street, suite, city, zipcode: String?
    var geo: Geo?
}

// MARK: - Geo
struct Geo {
    var lat, lng: String?
}

// MARK: - Company
struct Company {
    var name, catchPhrase, bs: String?
}
