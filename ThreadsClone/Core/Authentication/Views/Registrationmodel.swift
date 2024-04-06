//
//  Views.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/4/24.
//

import Foundation


class Registrationmodel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username)
    }
}//class Registration Model
