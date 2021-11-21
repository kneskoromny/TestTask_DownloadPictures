//
//  Album.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let userID, id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title
        }
}
