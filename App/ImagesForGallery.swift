//
//  ImagesForGallery.swift
//  App
//
//  Created by Anna Shuryaeva on 10.07.2022.
//

import Foundation
import UIKit

class ImagesForGallery {
    
    var images = [UIImage]()
    init() {
        for i in 1...12 {
            let image = UIImage(named: "IMG_\(i)")!
            images.append(image)
        }
    }
}
