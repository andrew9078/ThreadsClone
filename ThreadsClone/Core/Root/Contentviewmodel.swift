//
//  Contentviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/4/24.
//

import Foundation
import Combine
import Firebase

class Contentviewmodel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancel = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }//init
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancel)
    }//private fun
    
}
