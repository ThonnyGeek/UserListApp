//
//  PhotosDataModel.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation

// MARK: - PhotosDatum
struct PhotosDatum: Decodable, Hashable {
    var albumID, id: Int?
    var title: String?
    var url, thumbnailURL: String?
}
