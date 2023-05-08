//
//  RoundedView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 8/05/23.
//

import Foundation
import SwiftUI

struct RoundedView: View {
    
    let cornerRadius: CGFloat
    let width: CGFloat
    let height: CGFloat
//    var x: CGFloat?
    var x: CGFloat {
        return (width / 10) * 2
    }
//    var y: CGFloat?
    var y: CGFloat {
        return ((height / 10) * 2) + ((height / 10) / 2)
    }
    
    var body: some View {
        ZStack {
            Color.gray3.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill().foregroundColor(Color.gray4)
                .frame(width: width, height: height)
                .shadow(color: .grayTransparentBackground, radius: x, x: x, y: y)
                .shadow(color: .white, radius: x, x: -x, y: -y)
                .padding(.vertical, (x * 2))
                .padding(.horizontal, (x * 2))
        }
    }
}
