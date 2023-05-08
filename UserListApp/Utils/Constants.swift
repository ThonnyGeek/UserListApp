//
//  Constants.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import Combine
import UIKit

public struct Constants {
    static func onReceive(_ completion: Subscribers.Completion<Never>) {
        switch completion {
        case .finished:
            print("Finished")
        case .failure(let error):
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    static var cancellables = Set<AnyCancellable>()
}

public struct Sizes {
    static let width = UIScreen.main.bounds.width
    
    static let height = UIScreen.main.bounds.height
}
