//
//  ContentView.swift
//  UserListApp
//
//  Created by Thony Gonzalez on 7/05/23.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var viewModel: UserListViewModel
    @EnvironmentObject var userDataObject: UserDataObject
    @EnvironmentObject var networkError: NetworkError
    @Environment(\.presentationMode) var presentationMode
    let fontSize: CGFloat = 15
    
    var body: some View {
        UserListCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            
            Color.gray3.ignoresSafeArea()
            
            if viewModel.isConnected {                
                ScrollView {
                    if viewModel.userInfoList != nil {
                        ForEach(0..<viewModel.userInfoList!.count, id: \.self) { index in
                                
                            Button {
                                userDataObject.user = viewModel.userInfoList?[index]
                                userDataObject.thumbnailURL = viewModel.photosDataList?[index].url
                                viewModel.didTapUserDetailButton()
                            } label: {
                                userInfoView(url: viewModel.photosDataList?[index].url, name: viewModel.userInfoList?[index].name , email: viewModel.userInfoList?[index].email, website: viewModel.userInfoList?[index].website)
                                    .foregroundColor(.black)
                            }
                            .padding(30)

                            Divider()
                        }
                    }
                }
                .refreshable {
                    viewModel.fetchUserListData()
                    viewModel.fetchPhotosData()
                }
            }
            
            GeometryReader { geometry in
                LinearGradient(gradient: Gradient(colors: [.grayTransparentBackground, .gray3]), startPoint: .top, endPoint: .bottom)
                    .frame(height: geometry.safeAreaInsets.top)
                    .ignoresSafeArea()
                    .frame(maxHeight: .infinity, alignment: .top)
                        }
                    
            if networkError.isNetworkError != nil {
                if networkError.isNetworkError! {
                    ZStack {
                        NetworkFailView()
                        
                        Button {
                            networkError.isNetworkError = false
                            viewModel.fetchUserListData()
                            viewModel.fetchPhotosData()
                        } label: {
                            HStack {
                                Text("Reintentar")
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
                        .offset(y: 25)
                    }
                    
                }
            }
            
            if !viewModel.isConnected {
                ZStack {
                    NetworkFailView()
                    
                    Button {
                        viewModel.didTapRetryConnectionButton()
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
                    .offset(y: 25)
                }
            }
        }
        .onChange(of: viewModel.userInfoList != nil, perform: { newValue in
            if newValue {
                networkError.isNetworkError = false
            }
        })
        .onAppear {
            viewModel.isConnected = NetworkManager.isConnectedToNetwork()
            print("viewModel.isConnected: \(viewModel.isConnected)")
        }
        .environmentObject(userDataObject)
        .environmentObject(networkError)
    }
    
    private func userInfoView(url: String?, name: String?, email: String?, website: String?) -> some View {
        VStack {
            HStack {
                
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
                    
                    AsyncImage(url: URL(string: url ?? "")) { phase in
                        if phase.image == nil {
                            ZStack {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 90, height: 90)
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
                
                Spacer()
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Name: ")
                            .font(.poppinsSemiBold(fontSize))
                        Spacer()
                        Text(name ?? "")
                            .font(.poppinsRegular(fontSize))
                    }
                    
                    HStack {
                        Text("Email: ")
                            .font(.poppinsSemiBold(fontSize))
                        Spacer()
                        Text(email ?? "")
                            .font(.poppinsRegular(fontSize))
                    }
                    
                    HStack {
                        Text("Website: ")
                            .font(.poppinsSemiBold(fontSize))
                        Spacer()
                        Text(website ?? "")
                            .font(.poppinsRegular(fontSize))
                    }
                    
                }
                .frame(width: Sizes.width * 0.65, alignment: .leading)
            }
        }
        .frame(width: Sizes.width * 0.9)
    }
}

struct UserListView_Previews: PreviewProvider {
    
    static var userDataObject = UserDataObject()
    static var networkError = NetworkError()
    
    static var previews: some View {
        
        Group {
            UserListView(viewModel: UserListViewModel(userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone SE (3rd generation)")
            
            UserListView(viewModel: UserListViewModel(userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
            
            UserListView(viewModel: UserListViewModel(userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
                .previewDisplayName("iPhone 14 Pro Max")
            
            UserListView(viewModel: UserListViewModel(userListService: UserListService()))
                .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
                .previewDisplayName("iPad (10th generation)")
        }
        .environment(\.locale, .init(identifier: "es"))
        .environmentObject(userDataObject)
        .environmentObject(networkError)
    }
}
