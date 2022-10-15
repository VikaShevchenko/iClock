//
//  AlarmTableViewCell.swift
//  IClock
//
//  Created by 1 on 24.09.2022.
//

import UIKit



class AlarmTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var signalNameLabel: UILabel!
    @IBOutlet weak var alarmSwitcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

