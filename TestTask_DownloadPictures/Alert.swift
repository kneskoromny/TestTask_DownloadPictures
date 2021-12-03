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
              and handler: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: "Ошибка!",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                    style: .default,
                                    handler: handler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        controller.present(alert, animated: true)
    }
}
