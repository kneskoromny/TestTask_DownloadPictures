//
//  NetworkManager.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let strURL = "https://jsonplaceholder.typicode.com/users"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ users: [User]) -> Void) {
        guard let url = URL(string: strURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users = try decoder.decode([User].self, from: data)
                print(#function, users)
                DispatchQueue.main.async {
                    completion(users)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
}
