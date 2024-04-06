//
//  previewprovider.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation
import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }//developerpreview
}


class DeveloperPreview{
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Lionel Messi", email: "Messi@gmail.com", username: "Real Messi1")
    
}
