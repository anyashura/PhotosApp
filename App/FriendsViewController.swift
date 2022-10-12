//
//  FriendsViewController.swift
//  App
//
//  Created by Anna Shuryaeva on 16.07.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    private let cellID = "FriendTableViewCell"
    private let modelUser = ModelUser()

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = modelUser.users[section]
        return section.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return modelUser.users.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Men"
        } else {
            return "Women"
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? FriendTableViewCell
        else { return UITableViewCell() }
        cell.friendImageView.image = user.image
        cell.friendNameLabel.text = user.name

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        let alert = UIAlertController(title: user.name, message: user.city, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Profile", style: .default) { _ in
            self.performSegue(withIdentifier: "goToUserProfile", sender: indexPath)
        }

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.modelUser.users[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        }
        alert.addAction(profileAction)
        alert.addAction(deleteAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUserProfile" {
            guard let vc = segue.destination as? UserViewController else { return }
            guard let indexPath = sender as? IndexPath else { return }
            let section = modelUser.users[indexPath.section]
            let user = section[indexPath.row]
            vc.user = user
        }
    }

}
