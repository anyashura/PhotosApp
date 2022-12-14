//
//  ViewController.swift
//  App
//
//  Created by Anna Shuryaeva on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let photoGallery = ImagesForGallery()
    private let countOfCells = 3
    private let sizeOfSpacing: CGFloat = 2.0
    private let identifier = "cellImage"
    
    @IBOutlet private weak var photosView: UICollectionView!
    @IBOutlet private weak var profileAvatar: UIImageView!
    @IBOutlet private weak var profileItem: UINavigationItem!
    @IBOutlet private weak var profileNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileItem.titleView?.backgroundColor = .green
        profileAvatar.layer.borderWidth = 3.0
        profileAvatar.layer.borderColor = UIColor.gray.cgColor
        profileAvatar.layer.cornerRadius = 70
        profileAvatar.backgroundColor = .white
        
        photosView.dataSource = self
        photosView.delegate = self
        photosView.layer.borderWidth = 2.0
        photosView.layer.borderColor = UIColor.white.cgColor
//        photosView.register(UINib(nibName: ("ImageCollectionViewCell"), bundle: nil),  forCellWithReuseIdentifier: identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        profileNameLabel.text = UserDefaults.standard.string(forKey: "nameKey")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCollectionViewCell
        let image = photoGallery.images[indexPath.item]
        cell.photoView.image = image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthOfCell = frameCV.width / CGFloat(countOfCells)
        let heightOfCell = widthOfCell
        let spacing = CGFloat(countOfCells + 1) * sizeOfSpacing / CGFloat(countOfCells)
        
        return CGSize(width: widthOfCell - spacing, height: heightOfCell - sizeOfSpacing*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenPhotoViewController") as! FullScreenPhotoViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
