//
//  FullScreenCollectionViewCell.swift
//  App
//
//  Created by Anna Shuryaeva on 11.07.2022.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet private weak var scrollView: UIScrollView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.6
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        return self.scrollView.zoomScale = 1.0
    }
}

