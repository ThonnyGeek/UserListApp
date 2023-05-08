//
//  NetworkFailView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import SwiftUI

struct NetworkFailView: View {
    var body: some View {
        ZStack {
            Color.grayTransparent2.ignoresSafeArea()
            
            VStack (spacing: 20) {
                Text("Network error")
                    .font(.poppinsBold(20))
                    .foregroundColor(.redText)
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Retry")
                        Image(systemName: "repeat.circle")
                    }
                    .font(.poppinsRegular(18))
                    .foregroundColor(.black)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray2)
                    }
                }
                .opacity(0)
            }
            .padding(30)
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
            }
        }
    }
}

struct NetworkFailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkFailView()
    }
}
