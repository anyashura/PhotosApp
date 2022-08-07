//
//  User.swift
//  App
//
//  Created by Anna Shuryaeva on 18.07.2022.
//

import Foundation
import UIKit

class User: NSObject {
    
    enum Gender {
        case male
        case female
    }
    
    let name: String
    let city: String
    let image: UIImage
    let gender: Gender
    
    init(name: String, city: String, image: UIImage, gender: Gender) {
        self.name = name;
        self.city = city;
        self.image = image;
        self.gender = gender
    }
}
