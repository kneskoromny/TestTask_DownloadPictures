//
//  NetworkManager.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import Foundation

enum URLStrings: String {
    case users = "https://jsonplaceholder.typicode.com/users"
    case albums = "https://jsonplaceholder.typicode.com/albums"
    case photos = "https://jsonplaceholder.typicode.com/photos"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData<T: Codable>(strURL: String,
                               type: T.Type,
                               completion: @escaping (_ objects: T) -> Void) {
        guard let url = URL(string: strURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let objects = try decoder.decode(type, from: data)
                DispatchQueue.main.async {
                    completion(objects)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
}
