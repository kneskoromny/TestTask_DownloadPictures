//
//  PhotoImageView.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 23.11.2021.
//

import UIKit

class PhotoImageView: UIImageView {
    
    // MARK: - IB Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCustomView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addCustomView()
    }
    
    // MARK: - Work with image
    func loadImage(strURL: String) {
        ImageManager.shared.fetchImage(strUrl: strURL) { image in
            
            self.imageView.image = image
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }
    
    // MARK: - Connect xib
    private func addCustomView() {
        Bundle.main.loadNibNamed("PhotoImageView",
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
    }
}
