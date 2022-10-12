//
//  SettingsTableViewController.swift
//  App
//
//  Created by Anna Shuryaeva on 15.07.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var soundsSwitch: UISwitch!
    @IBOutlet private weak var volumeSlider: UISlider!

    private let nameKey = "nameKey"
    private let soundsKey = "soundsKey"
    private let volumeKey = "volumeKey"

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaults.standard.string(forKey: nameKey) {
            nameField.text = name
        }
        soundsSwitch.isOn = UserDefaults.standard.bool(forKey: soundsKey)
        volumeSlider.value = UserDefaults.standard.float(forKey: volumeKey)
    }

    @IBAction private func changeNameAction(_ sender: UITextField) {
        let nameText = sender.text
        UserDefaults.standard.set(nameText, forKey: nameKey)
    }

    @IBAction private func changeSoundsAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundsKey)
    }

    @IBAction private func changeVolumeAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volumeKey)
    }
}
