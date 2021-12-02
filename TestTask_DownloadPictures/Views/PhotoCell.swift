//
//  PhotoCell.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    let photoView: CustomView = {
        let pv = CustomView(frame: .zero)
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.layer.cornerRadius = 15
        pv.layer.masksToBounds = true
        
        pv.label.backgroundColor = .darkGray
        pv.label.textColor = .white
        pv.label.textAlignment = .center
        pv.label.numberOfLines = 0
        pv.label.font = UIFont(name: "Menlo", size: 12)
        
        return pv
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addPhotoView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
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
    
    // MARK: - Private methods
    private func addPhotoView() {
        contentView.addSubview(photoView)
        photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
            .isActive = true
        photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        photoView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            .isActive = true
        photoView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            .isActive = true
    }
    
    func updateView(with photo: Photo) {
        
        photoView.imageView.spinner.startAnimating()
        photoView.label.text = photo.title
        photoView.imageView.loadImage(strURL: photo.url)
    }
}
