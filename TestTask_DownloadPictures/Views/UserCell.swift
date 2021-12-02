//
//  UserCell.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import UIKit


class UserCell: UITableViewCell {
    
    func updateView(with name: String) {

        var content = defaultContentConfiguration()
        content.text = name
        contentConfiguration = content
    }
}
