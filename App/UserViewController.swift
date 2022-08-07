//
//  UserViewController.swift
//  App
//
//  Created by Anna Shuryaeva on 30.07.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    var user: User!

    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        cityLabel.text = user.city
        userView.image = user.image
        userView.layer.borderWidth = 3.0
        userView.layer.cornerRadius = 120
        userView.clipsToBounds = true
        if user.gender == .male {
            userView.layer.borderColor = UIColor.blue.cgColor
        } else {
            userView.layer.borderColor = UIColor.red.cgColor
        }
    }
}
