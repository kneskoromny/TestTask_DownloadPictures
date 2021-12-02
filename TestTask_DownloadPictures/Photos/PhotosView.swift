//
//  PhotosView.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit

protocol PhotosViewProtocol: AnyObject {
    func updateUI()
}

class PhotosView: UIViewController {
    
    // MARK: - UI Elements
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        return cv
    }()
    
    private let label: UILabel = {
        let l = UILabel()
        l.text = "Label"
        l.backgroundColor = .green
        return l
    }()
    
    var presenter: PhotosPresenterProtocol!
    
    // MARK: - Collection View Customization
    private let itemsPerRow: CGFloat = 1
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addCollView()
    }
    
    // MARK: - UI Customization
    private func addCollView() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor)
            .isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
            .isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            .isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            .isActive = true
    }
}

// MARK: - Collection View Data Source
extension PhotosView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        presenter.photosCount
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell",
                                                      for: indexPath) as! PhotoCell
        cell.configureContentView()
        return cell
    }
}

// MARK: - Collection View Delegate FlowLayout
extension PhotosView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    // вертикальный отступ
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInserts.top
    }
    // горизонтальный отступ
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInserts.left
    }
}
extension PhotosView: PhotosViewProtocol {
    func updateUI() {
        collectionView.reloadData()
    }
}

