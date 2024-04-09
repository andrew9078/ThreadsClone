//
//  Threadservice.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/9/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Threadservice{
    
    static func uploadThread(_ thread: Thread) async throws{
        guard let threadData = try? Firestore.Encoder().encode(thread) else {
            return}
        
        let ref = try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }//static func
    
    
    static func fetchThreads() async throws -> [Thread]{
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
    }//static func fetch
    
}//struct threadservice
