//
//  UserListPresenter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import Foundation

// MARK: - Protocol requirements
protocol UserListPresenterProtocol {
    var usersCount: Int { get }
    
    func getUser(at indexPath: IndexPath) -> User?
    
    func fetchData()
    func deleteFromStorage()
    
    func launchTimer()
    func didTap(user: User)
}

class UserListPresenter {
    // MARK: - Dependencies
    weak var view: UserListViewProtocol?
    var router: UserListRouterProtocol
    
    // MARK: - Data
    var users = [User]()
    var albums = [Album]()
    var photos = [Photo]()
    
    var timerCounter = 5.0
    
    // MARK: - Initializers
    init(view: UserListViewProtocol, router: UserListRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Fetch from web
    private func fetchUsers() {
        NetworkManager.shared.fetchData(strURL: URLStrings.users.rawValue,
                                        type: [User].self) { [weak self] objects in
            self?.users = objects
            self?.saveToStorage(self?.users ?? [])
            
            self?.view?.updateView()
        }
    }
    private func fetchAlbums() {
        NetworkManager.shared.fetchData(strURL: URLStrings.albums.rawValue,
                                        type: [Album].self) { [weak self] objects in
            self?.albums = objects
        }
    }
    private func fetchPhotos() {
        NetworkManager.shared.fetchData(strURL: URLStrings.photos.rawValue,
                                        type: [Photo].self) { [weak self] objects in
            self?.photos = objects
        }
    }
    
    // MARK: - Work with storage
    private func saveToStorage(_ objects: [User]) {
        StorageManager.shared.save(objects)
    }
    private func loadFromStorage() {
        users = StorageManager.shared.fetch(type: [User].self)
    }
    
    // MARK: - Find user photos
    private func getPhotos(with userID: Int) -> [Photo] {
            let albumIDs = albums.filter { album in
                album.userID == userID
            }.map { $0.id }
            
            return photos.filter { photo in
                albumIDs.contains(photo.albumID)
            }
        }
    
    // MARK: - Timer action
    @objc func updateUI() {
        if users.isEmpty {
            loadFromStorage()
            view?.updateView()
            view?.showAlert()
        }
    }
}

// MARK: - Protocol requirements implementation
extension UserListPresenter: UserListPresenterProtocol {
    var usersCount: Int {
        users.count
    }
    func getUser(at indexPath: IndexPath) -> User? {
        switch usersCount {
        case 0: return nil
        default: return users[indexPath.row]
        }
    }
    
    func fetchData() {
        fetchUsers()
        fetchAlbums()
        fetchPhotos()
    }
    func deleteFromStorage() {
        let objects = StorageManager.shared.fetch(type: [User].self)
        StorageManager.shared.delete(objects)
    }
    
    func launchTimer() {
        Timer.scheduledTimer(timeInterval: timerCounter,
                             target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    func didTap(user: User) {
        let userPhotos = getPhotos(with: user.id)
        router.show(name: user.name, photos: userPhotos)
    }
}
