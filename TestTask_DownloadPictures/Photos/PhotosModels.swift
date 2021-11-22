//
//  PhotosModels.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

typealias PhotoCellViewModel = Photos.ShowPhotos.ViewModel.PhotoCellViewModel

enum Photos {
    
    // MARK: Use cases
    enum ShowPhotos {
        struct Request {
            
        }
        // интерактор презентеру
        struct Response {
            let name: String
            let photos: [Photo]
        }
        // презентер в контроллер
        struct ViewModel {
            let name: String
            
            struct PhotoCellViewModel: CellIdentifiable {
                let title: String
                let strURL: String
                
                var identifier: String {
                    "PhotoCell"
                }
                init(photo: Photo) {
                    title = photo.title
                    strURL = photo.url
                }
            }
            let rows: [PhotoCellViewModel]
        }
    }
}
