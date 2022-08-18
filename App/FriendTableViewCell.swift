//
//  FriendsTableViewCell.swift
//  App
//
//  Created by Anna Shuryaeva on 18.07.2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
