//
//  PhotosPresenter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import Foundation

// MARK: - Protocol requirements
protocol PhotosPresenterProtocol {
    var photosCount: Int { get }
    
    func getPhoto(at indexPath: IndexPath) -> Photo
}

class PhotosPresenter {
    // MARK: - Dependencies
    private let router: PhotosRouterProtocol
    weak var view: PhotosViewProtocol?
    
    // MARK: - Data
    var photos = [Photo]()
    
    // MARK: - Initializers
    init(photos: [Photo], router: PhotosRouterProtocol) {
        self.photos = photos
        self.router = router
    }
}
// MARK: - Protocol requirements implementation
extension PhotosPresenter: PhotosPresenterProtocol {
    var photosCount: Int {
        photos.count
    }
    
    func getPhoto(at indexPath: IndexPath) -> Photo {
        photos[indexPath.row]
    }
}
