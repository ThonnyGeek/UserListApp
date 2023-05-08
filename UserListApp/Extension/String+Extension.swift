//
//  String+Extension.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import SwiftUI

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

