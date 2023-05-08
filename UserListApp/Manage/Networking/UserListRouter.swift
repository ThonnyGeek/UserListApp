//
//  UserListRouter.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import Alamofire

enum UserListRouter: URLRequestConvertible {
    case getUsersData
    case getPhotos
//    case getBonuses(page: Int, per_page: Int)
    
    var path: String {
        switch self {
        case .getUsersData:
            return "/users"
        case .getPhotos:
            return "/photos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsersData, .getPhotos://, .getBonuses
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try "\(Networking.base_url_string)".asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.httpMethod = method.rawValue
        
//        urlRequest.setValue(LocalizationManager.getCurrentLanguage().languageCode, forHTTPHeaderField: "locale")
//        urlRequest.setValue(LocalizationManager.getCurrentLanguage().languageCode, forHTTPHeaderField: "lang")
        
        switch self {
        case .getUsersData, .getPhotos:
            urlRequest
        }
        print("url:",urlRequest.url)
        return urlRequest
    }
}
