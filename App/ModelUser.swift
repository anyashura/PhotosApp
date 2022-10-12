//
//  ModelUser.swift
//  App
//
//  Created by Anna Shuryaeva on 18.07.2022.
//

import Foundation
import UIKit

class ModelUser {

    var users = [[User]]()

    init() {
        setUp()
    }

    private func setUp() {
        let man1 = User(name: "Nick", city: "Moscow", image: UIImage(named: "IMG_2")!, gender: User.Gender.male)
        let man2 = User(name: "David", city: "New York", image: UIImage(named: "IMG_3")!, gender: User.Gender.male)
        let manArray = [man1, man2]

        let woman1 = User(name: "Dana", city: "London", image: UIImage(named: "IMG_4")!, gender: User.Gender.female)
        let woman2 = User(name: "Lina", city: "Sidney", image: UIImage(named: "IMG_5")!, gender: User.Gender.female)
        let womanArray = [woman1, woman2]

        users.append(manArray)
        users.append(womanArray)
    }

}
