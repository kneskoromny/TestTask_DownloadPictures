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
    
    func save(_ objects: [User]) {
        userDefaults.set(try? JSONEncoder().encode(objects), forKey: key)
    }
    
    func fetch() -> [User] {
        var data = [User]()
        if let savedData = userDefaults.value(forKey: key) as? Data {
            data = try! JSONDecoder().decode([User].self, from: savedData)
            return data
        }
        return data
    }
    
    func delete(_ objects: [User]) {
        objects.forEach { _ in
            userDefaults.removeObject(forKey: key)
        }
    }
}
