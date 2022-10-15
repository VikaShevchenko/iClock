//
//  AlarmSleepSettingsTableViewCell.swift
//  IClock
//
//  Created by 1 on 24.09.2022.
//

import UIKit


protocol AlarmSleepSettingsTableViewCellDelegate {
    func showSleepSettingsScreen()
}

class AlarmSleepSettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var alarmNameLabel: UILabel!
    @IBOutlet weak var alarmSettingsButton: UIButton!
    
    var delegate: AlarmSleepSettingsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alarmSettingsButton.layer.cornerRadius = 10
    }

    @IBAction func showSleepSettingsScreen(_ sender: UIButton) {
        delegate?.showSleepSettingsScreen()
    }
    

}
