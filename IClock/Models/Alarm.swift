//
//  Alarm.swift
//  IClock
//
//  Created by 1 on 23.09.2022.
//

import Foundation


class Alarm {
    var time: Double
    var signalName: String
    var isOn: Bool
    
    init(time: Double, signalName: String, isOn: Bool) {
        self.time = time
        self.signalName = signalName
        self.isOn = isOn
    }
}
