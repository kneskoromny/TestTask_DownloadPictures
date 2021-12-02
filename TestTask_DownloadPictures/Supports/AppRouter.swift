//
//  AppRouter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit

protocol AppRouterType {
    func showRootScreen()
}

class AppRouter: AppRouterType {
    private(set) var window: UIWindow

    init(window: UIWindow = UIWindow()) {
        self.window = window
    }

    func showRootScreen() {
        let storyboard = UIStoryboard(name: "UserList", bundle: Bundle.main)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
                let userListView = navigationController.viewControllers.first as? UserListView else {
            fatalError("Не найден UINavigationController!")
        }

        let router = UserListRouter(view: userListView)
        let presenter = UserListPresenter(view: userListView, router: router)
        userListView.presenter = presenter
        presenter.view = userListView

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
