//
//  FullScreenPhotoViewController.swift
//  App
//
//  Created by Anna Shuryaeva on 10.07.2022.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    var photoGallery: ImagesForGallery!
    var indexPath: IndexPath!

    @IBOutlet private weak var collectionView: UICollectionView!

    private let countOfCells = 1
    private let identifier = "FullScreenCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.performBatchUpdates(nil) { (_) in self.collectionView.scrollToItem(at: self.indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }
    }
}

extension FullScreenPhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? FullScreenCollectionViewCell
        else { return UICollectionViewCell() }
        cell.photoView.image = photoGallery.images[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthOfCell = frameCV.width
        let heightOfCell = widthOfCell

        return CGSize(width: widthOfCell, height: heightOfCell)
    }

}
