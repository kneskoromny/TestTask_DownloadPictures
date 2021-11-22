//
//  CustomView.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 22.11.2021.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - IB Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCustomView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addCustomView()
    }
    
    // MARK: - Private methods
    private func addCustomView() {
        Bundle.main.loadNibNamed("CustomView",
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
    }
}
