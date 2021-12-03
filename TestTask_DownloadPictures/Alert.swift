//
//  Alert.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 03.12.2021.
//

import Foundation
import UIKit

struct Alert {
    static func show(in controller: UIViewController,
              with message: String,
              and completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: "Ошибка!",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { action in
            if let completion = completion {
                completion()
            }
        }
        
        alert.addAction(okAction)
        
        controller.present(alert, animated: true)
    }
}
