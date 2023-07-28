//
//  ViewModel.swift
//  MVVMDemo
//
//  Created by Nirmit Patel on 28/07/23.
//

import Combine
import Foundation


class ViewModel: ObservableObject {
    private let usersURL = "https://random-data-api.com/api/users/random_user?size=20"
    @Published var users:[User] = []
    private var task: AnyCancellable?
    
    func fetchUsers() {
        //use of combine here. we are becoming suscriber for the result coming from this url.
        //once we will get result local variable users will be updated. and now this will send notification to all suscriber waiting to get it updated. Our view will be listning to this notification and will update itself.
        task = URLSession.shared.dataTaskPublisher(for: URL(string: usersURL)!)
                    .map { $0.data }
                    .decode(type: [User].self, decoder: JSONDecoder())
                    .replaceError(with: [])
                    .eraseToAnyPublisher()
                    .receive(on: RunLoop.main)
                    .assign(to: \ViewModel.users, on: self)
    }
    
}
