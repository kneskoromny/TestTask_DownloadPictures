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
    
    func fetchImage(strUrl: String) -> Data? {
        guard let url = URL(string: strUrl) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        
        return imageData
    }
}
