//
//  NetworkManager.swift
//  UserProfile
//
//  Created by José leoncio Quispe rodriguez on 14/12/23.
//

import Foundation

class NetworkManager {
    
    static var shared  = NetworkManager()
    
    func getPost(completion: @escaping([Post]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Erro de URL")
        }
        
        URLSession.shared.dataTask(with: url) { dt, res, error in
            guard let data = dt, error == nil, let response = res as? HTTPURLResponse else { return }
             
            
            if response.statusCode == 200 {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                } catch let error {
                    print("Error service", error)
                }
                
            }
            
        }.resume()
        
        
        
    }
}
