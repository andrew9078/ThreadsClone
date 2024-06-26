//
//  Thread.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/9/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable{
    @DocumentID var threadId: String?

    let ownerUID: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id:String{
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
    
    
}//struct


