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
    
    func save<T: Codable>(_ objects: [T]) {
        userDefaults.set(try? JSONEncoder().encode(objects), forKey: key)
    }
    
    func fetch<T: Codable>(type: [T].Type) -> [T] {
        var data = [T]()
        if let savedData = userDefaults.value(forKey: key) as? Data {
            data = try! JSONDecoder().decode(type, from: savedData)
            return data
        }
        return data
    }
    
    func delete<T: Codable>(_ objects: [T]) {
        objects.forEach { _ in
            userDefaults.removeObject(forKey: key)
        }
    }
}
