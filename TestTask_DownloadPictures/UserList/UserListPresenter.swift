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
    
    func didTap(user: User)
}
class UserListPresenter {
    weak var view: UserListViewProtocol?
    var router: UserListRouterProtocol
    
    var users = [User]()
    
    var albums = [Album]()
    var photos = [Photo]()
    
    init(view: UserListViewProtocol, router: UserListRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    private func fetchUsers() {
        NetworkManager.shared.fetchData(strURL: URLStrings.users.rawValue,
                                        type: [User].self) { objects in
            self.users = objects
            self.view?.updateView()
            
        }
    }
    private func fetchAlbums() {
        NetworkManager.shared.fetchData(strURL: URLStrings.albums.rawValue,
                                        type: [Album].self) { objects in
            self.albums = objects
        }
    }
    private func fetchPhotos() {
        NetworkManager.shared.fetchData(strURL: URLStrings.photos.rawValue,
                                        type: [Photo].self) { objects in
            self.photos = objects
        }
    }
    private func getPhotos(with userID: Int) -> [Photo] {
            let albumIDs = albums.filter { album in
                album.userID == userID
            }.map { $0.id }
            
            return photos.filter { photo in
                albumIDs.contains(photo.albumID)
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
    // TODO: добавить title для navbara
    func didTap(user: User) {
        let userPhotos = getPhotos(with: user.id)
        router.show(photos: userPhotos)
    }
}
