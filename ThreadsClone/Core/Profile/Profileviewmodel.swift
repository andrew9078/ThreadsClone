//
//  Profileviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation
import Combine

class Profileviewmodel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }//init
    
    private func setupSubscribers(){
        Userservice.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("Debug: user in view model is: \(user)")
        }.store(in: &cancellables)
    }//private func setupSubscribers
    
}//class Profileviewmodel
