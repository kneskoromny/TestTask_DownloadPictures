//
//  AppRouter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit
// MARK: - Protocol requirements
protocol AppRouterType {
    func showRootScreen()
}

// MARK: - Protocol requirements implementation
class AppRouter: AppRouterType {
    private var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func showRootScreen() {
        let storyboard = UIStoryboard(name: "UserList", bundle: Bundle.main)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
              let userListView = navigationController.viewControllers.first as? UserListView
        else {
            fatalError("Не найдены контроллеры!")
        }
        
        userListView.navigationItem.title = "Users"
        
        
        let router = UserListRouter(view: userListView)
        let presenter = UserListPresenter(view: userListView, router: router)
        userListView.presenter = presenter
        
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
