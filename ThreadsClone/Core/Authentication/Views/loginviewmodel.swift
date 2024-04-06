//
//  loginviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/4/24.
//

import Foundation



class loginviewmodel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}//class loginviewmodel
