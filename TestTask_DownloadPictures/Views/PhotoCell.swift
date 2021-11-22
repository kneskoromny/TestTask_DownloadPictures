//
//  PhotoCell.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    let cellCustomView: CustomView = {
        let iv = CustomView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        
        iv.label.backgroundColor = .darkGray
        iv.label.textColor = .white
        iv.imageView.backgroundColor = .lightGray
        return iv
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addCustomView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public properties
    func configureContentView() {
        contentView.layer.cornerRadius = 15
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 7)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                        cornerRadius: contentView.layer.cornerRadius)
            .cgPath
    }
    
    // MARK: - Private properties
    private func addCustomView() {
        contentView.addSubview(cellCustomView)
        cellCustomView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
            .isActive = true
        cellCustomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        cellCustomView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            .isActive = true
        cellCustomView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            .isActive = true
    }  
}
