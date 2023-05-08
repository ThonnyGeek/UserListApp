//
//  SwiftUIView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 8/05/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.gray3.ignoresSafeArea()
            
            ZStack {
                ZStack {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)
                    
                    ProgressView()
                }
                
                AsyncImage(url: URL(string: "https://via.placeholder.com/600/92c952")) { phase in
                    if phase.image == nil {
                        ZStack {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .foregroundColor(.gray)
                            
                            ProgressView()
                        }
                    } else {
                        phase.image?
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(1)
                .background {
                    Circle().stroke(lineWidth: 1)
                }
                .background {
                    RoundedView(cornerRadius: 50, width: 75, height: 75)
                }
                .padding(2)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
