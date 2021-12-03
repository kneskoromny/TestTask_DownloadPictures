//
//  StorageManager.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 03.12.2021.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "User"
    
    private init() {}
    
    func save<T: Decodable>(_ value: [T]) {
        userDefaults.set(value, forKey: key)
    }
    
    func fetch<T: Decodable>() -> [T]? {
        userDefaults.value(forKey: key) as? [T]
    }
    
    func delete<T: Decodable>(_ objects: [T]) {
        objects.forEach { _ in
            userDefaults.removeObject(forKey: key)
        }
    }
}
