//
//  File.swift
//  
//
//  Created by José leoncio Quispe rodriguez on 18/12/23.
//


import Foundation

struct Post: Codable, Identifiable {
    var id: Int
    let userId: Int
    let title, body: String
    
}
