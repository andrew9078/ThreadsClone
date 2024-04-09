//
//  Feedviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/9/24.
//

import Foundation


class Feedviewmodel: ObservableObject{
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads()}
    }//init
    
    @MainActor
    func fetchThreads() async throws{
        self.threads = try await Threadservice.fetchThreads()
        try await fetchThreadusers()
    }//func fetchthreads
    
    private func fetchThreadusers() async throws {
        for i in 0 ..< threads.count{
            let thread = threads[i]
            let ownerUID = thread.ownerUID
            
            let threadUser = try await Userservice.fetchUsers(withUID: ownerUID)
            
            threads[i].user = threadUser
        }
    }//func fetchthreaduser
    
    
}//class feedbiew model
