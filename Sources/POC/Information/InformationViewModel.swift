//
//  InformationViewModel.swift
//  UserProfile
//
//  Created by José leoncio Quispe rodriguez on 14/12/23.
//

import Foundation
import Combine

protocol getUserInfo: AnyObject {
    func getUserData()
}


class InformationViewModel: ObservableObject, getUserInfo {
    
    
    init() {
        getUserData()
    }
    
   @Published var userPost = [Post]() {
        didSet {
            didChange.send(self)
        }
    }

    
    let didChange = PassthroughSubject<InformationViewModel, Never>()
    
    func getUserData() {
        NetworkManager.shared.getPost {
            self.userPost = $0
        }
    }
    
    
}
