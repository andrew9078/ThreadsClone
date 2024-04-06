//
//  Exploreviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation

class Exploreviewmodel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers()}
    }//init
    
    @MainActor
    private func fetchUsers() async throws {
        
        self.users = try await Userservice.fetchUsers()
        
    }//private func
    
    
}
