//
//  UserListConfigurator.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import Foundation

class UserListConfigurator {
    static let shared = UserListConfigurator()
    
    private init() {}
    
    func configure(with viewController: UserListViewController) {
        let interactor = UserListInteractor()
        let presenter = UserListPresenter()
        let router = UserListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
