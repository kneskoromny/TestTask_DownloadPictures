//
//  PhotoCell.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor)
            .isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            .isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            .isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
