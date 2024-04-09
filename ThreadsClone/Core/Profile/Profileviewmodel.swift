//
//  Profileviewmodel.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class Profileviewmodel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem?
    @Published var profileImage: Image?{
        didSet { Task {await loadImage() } }
    }
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }//init
    
    private func setupSubscribers(){
        Userservice.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }//private func setupSubscribers
    
    private func loadImage() async{
        guard let item = selectedItem else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
}//class Profileviewmodel
