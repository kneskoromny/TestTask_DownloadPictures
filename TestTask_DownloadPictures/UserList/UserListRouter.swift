//
//  UserListRouter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit

protocol UserListRouterProtocol {
    func show(photos: [Photo])
}

class UserListRouter {
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension UserListRouter: UserListRouterProtocol {
    func show(photos: [Photo]) {
        let storyboard = UIStoryboard(name: "Photos", bundle: Bundle.main)
        //guard let photosView = storyboard.instantiateViewController(withIdentifier: "PhotosView") as? PhotosView else { return }
        guard let photosView = storyboard.instantiateInitialViewController() as? PhotosView else { return }
        
        let router = PhotosRouter(view: photosView)
        let presenter = PhotosPresenter(photos: photos, router: router)
        photosView.presenter = presenter
        presenter.view = photosView
        photosView.modalPresentationStyle = .automatic
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.show(photosView, sender: nil)
        }
    }   
}
