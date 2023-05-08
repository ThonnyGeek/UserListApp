//
//  Font+Extension.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import SwiftUI

extension Font {
    static func poppinsBold(_ size: CGFloat) -> Font {
        return Font.custom("Poppins-Bold", size: size)
    }
    
    static func poppinsSemiBold(_ size: CGFloat) -> Font {
        return Font.custom("Poppins-SemiBold", size: size)
    }
    
    static func poppinsRegular(_ size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func poppinsMedium(_ size: CGFloat) -> Font {
        return Font.custom("Poppins-Medium", size: size)
    }
}
