//
//  ContentView.swift
//  MVVMDemo
//
//  Created by Nirmit Patel on 27/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
                    List(viewModel.users, id: \.self) {
                        UserView(user: $0)
                    }.navigationBarTitle("Users")
                        .onAppear {
                            self.viewModel.fetchUsers()
                    }
                }
    }
}

struct UserView: View {
    private let user: User
        init(user: User) {
            self.user = user
        }
        
        var body: some View {
            HStack {
                AsyncImage(url: URL(string: user.avatar), content: { image in
                    image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 80, maxHeight: 80)
                }, placeholder: {
                               ProgressView()
                }
                )
                .frame(width: 80, height: 80)
                .border(.black)
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(user.firstName + " " + user.lastName)
                        .font(.system(size: 18))
                        .foregroundColor(Color.blue)
                    Text(user.userName)
                        .font(.system(size: 14))
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
