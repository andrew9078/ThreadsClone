//
//  Threadviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/9/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject{
    
    @Published var caption = ""
    
    func uploadThread() async throws{
        
        guard let uid = Auth.auth().currentUser?.uid else {return}

        let thread = Thread(ownerUID: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await Threadservice.uploadThread(thread)
    }//uploadThread
}//Creatthreadtmodel
