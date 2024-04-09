//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/4/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        FirebaseApp.configure()
        self.userSession = Auth.auth().currentUser
        
    }//init
    
    @MainActor
    func login(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await Userservice.shared.fetchCurrentUser()
            print("Debug: Created user \(result.user.uid)")
        }catch{
            print("Debug: Failed to create user with error \(error.localizedDescription)")
        }//catch
    }//func login
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("Debug: Created user \(result.user.uid)")
        }catch{
            print("Debug: Failed to create user with error \(error.localizedDescription)")
        }//catch
    }//func
    
    
    func signOut(){
        try? Auth.auth().signOut()//signs out on backend
        self.userSession = nil //this removes local session
        Userservice.shared.reset() //sets current user object to nil
    }
    
    
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id:String)
    async throws{
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else{ return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        Userservice.shared.currentUser = user
    }//private fun UploadUserData
    
}//class

