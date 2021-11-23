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
        let cv = CustomView(frame: .zero)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.cornerRadius = 15
        cv.layer.masksToBounds = true
        
        cv.label.backgroundColor = .darkGray
        cv.label.textColor = .white
        cv.label.textAlignment = .center
        cv.label.numberOfLines = 0
        cv.label.font = UIFont(name: "Menlo", size: 12)
        
        cv.imageView.backgroundColor = .lightGray
        cv.imageView.contentMode = .scaleToFill
        return cv
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
    private func updateView() {
        guard let viewModel = viewModel as? PhotoCellViewModel else {
            print(#function, "Apollo, we have problems!")
            return
        }
        cellCustomView.label.text = viewModel.title
        if let imageData = ImageManager.shared.fetchImage(strUrl: viewModel.strURL) {
            cellCustomView.imageView.image = UIImage(data: imageData)
        }
    }
}
