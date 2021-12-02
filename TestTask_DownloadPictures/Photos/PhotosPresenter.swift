//
//  PhotosPresenter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import Foundation

protocol PhotosPresenterProtocol {
    var photosCount: Int { get }
    
    func getPhoto(at indexPath: IndexPath) -> Photo
}

class PhotosPresenter {
    private let router: PhotosRouterProtocol
    weak var view: PhotosViewProtocol?
    
    var photos = [Photo]()
    
    init(photos: [Photo], router: PhotosRouterProtocol) {
        self.photos = photos
        self.router = router
    }
}

extension PhotosPresenter: PhotosPresenterProtocol {
    var photosCount: Int {
        self.photos.count
    }
    
    func getPhoto(at indexPath: IndexPath) -> Photo {
        photos[indexPath.row]
    }
}
