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
        
        pv.imageView.backgroundColor = .white
        pv.imageView.contentMode = .scaleToFill
        return pv
    }()
    
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addCustomView()
        
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
    private func addCustomView() {
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
    private func updateView() {
        guard let viewModel = viewModel as? PhotoCellViewModel else {
            print(#function, "Apollo, we have problems!")
            return
        }
        photoView.label.text = viewModel.title
//        if let imageData = ImageManager.shared.fetchImage(strUrl: viewModel.strURL) {
//            photoView.imageView.image = UIImage(data: imageData)
//        }
    }
}
