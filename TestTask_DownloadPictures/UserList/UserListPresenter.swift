//
//  UserListPresenter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import Foundation

protocol UserListPresenterProtocol {
    var usersCount: Int { get }
    
    func fetchData()
    func getUser(at indexPath: IndexPath) -> User?
}
class UserListPresenter {
    weak var view: UserListViewProtocol?
    var users = [User]()
    
    var albums = [Album]()
    var photos = [Photo]()
    
    init(view: UserListViewProtocol) {
        self.view = view
    }
    
    private func fetchUsers() {
        NetworkManager.shared.fetchData(strURL: URLStrings.users.rawValue,
                                        type: [User].self) { objects in
            self.users = objects
            print(self.users.count)
            self.view?.updateView()
            
        }
    }
    private func fetchAlbums() {
        NetworkManager.shared.fetchData(strURL: URLStrings.albums.rawValue,
                                        type: [Album].self) { objects in
            self.albums = objects
            print(self.albums.count)
        }
    }
    private func fetchPhotos() {
        NetworkManager.shared.fetchData(strURL: URLStrings.photos.rawValue,
                                        type: [Photo].self) { objects in
            self.photos = objects
            print(self.photos.count)
        }
    }
}

extension UserListPresenter: UserListPresenterProtocol {
    var usersCount: Int {
        self.users.count
    }
    
    func fetchData() {
        fetchUsers()
        fetchAlbums()
        fetchPhotos()
    }
    
    func getUser(at indexPath: IndexPath) -> User? {
        self.users[indexPath.row]
    }
}
