//
//  UserDetailView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    
    @StateObject var viewModel: UserDetailViewModel
    @EnvironmentObject var userDataObject: UserDataObject
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.gray3.ignoresSafeArea()
            
            ZStack {
                VStack {
                    //MARK: Top bar / Page title
                    VStack {
                        Text("User detail")
                            .font(Font.poppinsSemiBold(16))
                        
                        Rectangle()
                            .fill(Color.horizontalDividerColor)
                            .frame(height: 1)
                    }
                    .frame(width: Sizes.width)
                    
                    ScrollView {
                        AsyncImage(url: URL(string: userDataObject.thumbnailURL ?? "")) { phase in
                            if phase.image == nil {
                                ZStack {
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 140, height: 140)
                                        .foregroundColor(.gray)
                                    
                                    if viewModel.showProgressView {
                                        ProgressView()
                                    }
                                }
                            } else {
                                phase.image?
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(1)
                        .background {
                            Circle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(.horizontalDividerColor)
                                .shadow(color: .black, radius: 5, x: 0, y: 0)
                        }
                        .background {
                            RoundedView(cornerRadius: 100, width: 125, height: 125)
                        }
                        .padding(50)
                        
                        Divider()
                        
                        VStack {
                            
                            Text(userDataObject.user?.name ?? "Anthony Gonzalez")
                                .font(.poppinsSemiBold(20))
                                .padding(.vertical, 10)
                            
                            dataView(title: "Username: ", userData: userDataObject.user?.username ?? "")
                            dataView(title: "Email: ", userData: userDataObject.user?.email ?? "")
                            dataView(title: "Phone: ", userData: userDataObject.user?.phone ?? "")
                            dataView(title: "Website: ", userData: userDataObject.user?.website ?? "")
                        }
                        
                        Divider()
                        
                        VStack {
                            dataView(title: "Company name: ", userData: userDataObject.user?.company.name ?? "")
                            dataView(title: "Street: ", userData: userDataObject.user?.address.street ?? "")
                            dataView(title: "Suite: ", userData: userDataObject.user?.address.suite ?? "")
                            dataView(title: "City: ", userData: userDataObject.user?.address.city ?? "")
                            dataView(title: "Zipcode: ", userData: userDataObject.user?.address.zipcode ?? "")
                        }
                    }
                    .frame(width: Sizes.width * 0.9)
                }
                
                ZStack {
                    HStack {
                        Button {
                            viewModel.sheetAction()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            }
            .padding(.top, 15)
        }
        .environmentObject(userDataObject)

        
    }
    private func dataView(title: LocalizedStringKey, userData: String) -> some View {
        HStack {
            Text(title)
                .font(.poppinsSemiBold(15))
            
            Spacer()
            
            Text(userData)
                .font(.poppinsRegular(15))
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static var userDataObject = UserDataObject()
    
    static var previews: some View {
        
        Group {
            UserDetailView(viewModel: UserDetailViewModel(presentedItem: .constant(false), userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone SE (3rd generation)")
            
            UserDetailView(viewModel: UserDetailViewModel(presentedItem: .constant(false), userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
            
            UserDetailView(viewModel: UserDetailViewModel(presentedItem: .constant(false), userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
                .previewDisplayName("iPhone 14 Pro Max")
            
            UserDetailView(viewModel: UserDetailViewModel(presentedItem: .constant(false), userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
                .previewDisplayName("iPad (10th generation)")
        }
        .environment(\.locale, .init(identifier: "es"))
        .environmentObject(userDataObject)
    }
}

