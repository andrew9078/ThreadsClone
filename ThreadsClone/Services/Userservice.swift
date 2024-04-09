//
//  Userservice.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class Userservice{
    @Published var currentUser: User?
    
    static let shared = Userservice()
    
    init(){
        Task{ try await fetchCurrentUser()}
    }
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }//func fetchcurrentuser
    
    static func fetchUsers() async throws -> [User] {
        guard let currentuid = Auth.auth().currentUser?.uid else {return[]}
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({ $0.id != currentuid })
    }//static fun
    
    static func fetchUsers(withUID uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }//static func
    
    func reset(){
        self.currentUser = nil
    }//reset
    
    
}//Userservice
