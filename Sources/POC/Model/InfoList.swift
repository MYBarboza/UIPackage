//
//  File.swift
//  
//
//  Created by José leoncio Quispe rodriguez on 18/12/23.
//

import Foundation

public struct InfoList: Codable, Hashable {
    let id: Int
    let image: String?
    let name: String
    let description: String
    
    public init(id: Int, image: String?, name: String, description: String) {
        self.id = id
        self.image = image
        self.name = name
        self.description = description
    }

}

public struct InfoListData {
    
    public var infoListData: [InfoList] = []
    
    public init() {
        infoListData.append(InfoList(id: 1, image: "emoji-unicorn", name: "Avatar", description: "!Hay 32 opciones!"))
        infoListData.append(InfoList(id: 2, image: "", name: "Iniciales", description: "De tu nombre de perfil"))
    }
}
