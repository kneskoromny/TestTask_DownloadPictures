//
//  ImageManager.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 23.11.2021.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(strUrl: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: strUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}
