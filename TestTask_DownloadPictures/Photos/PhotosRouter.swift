//
//  PhotosRouter.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit

protocol PhotosRouterProtocol {
    
}

class PhotosRouter: PhotosRouterProtocol {
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
}


