//
//  Profilethreadfilter.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/2/24.
//

import Foundation

enum Profilethreadfilter: Int, CaseIterable, Identifiable{
    
    case threads
    case replies
    
    var title: String{
        switch self{
            case .threads: return "threads"
            case .replies: return "replies"
        }
    }//title
    
    var id: Int {return self.rawValue}
    
}//enum Profilethreadfilter

