//
//  ImageManager.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 23.11.2021.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    let cache = NSCache<AnyObject, AnyObject>()
    
    private init() {}
    
    func fetchImage(strUrl: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: strUrl) else { return }
        
        if let cachedImage = cache.object(forKey: url as AnyObject) as? UIImage {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data,
                      let image = UIImage(data: data) else {
                          print(#function, error?.localizedDescription ?? "No Description")
                    return
                }
                DispatchQueue.main.async {
                    
                    self.cache.setObject(image, forKey: url as AnyObject)
                    completion(image)
                }
            }.resume()
        }
    }
}
