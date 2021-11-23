//
//  UserListPresenter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol UserListPresentationLogic {
    func presentUsers(response: UserList.ShowUsers.Response)
}

class UserListPresenter: UserListPresentationLogic {
    
    weak var viewController: UserListDisplayLogic?
    
    func presentUsers(response: UserList.ShowUsers.Response) {
        
        var rows = [UserCellViewModel]()
        
        response.users.forEach { user in
            let user = UserCellViewModel(user: user)
            rows.append(user)
        }
        let viewModel = UserList.ShowUsers.ViewModel(rows: rows)
        
        viewController?.displayUsers(viewModel: viewModel)
    }
}
