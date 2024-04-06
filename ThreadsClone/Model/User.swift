//
//  User.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileimage: String?
    var bio: String?
    
        
}//struct User
