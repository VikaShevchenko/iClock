//
//  SleepSettingsPreviewViewController.swift
//  IClock
//
//  Created by 1 on 14.10.2022.
//

import UIKit


protocol SleepSettingsPreviewDelegate {
    func cancel()
}

class SleepSettingsPreviewViewController: UIViewController {
    
    var delegate: SleepSettingsPreviewDelegate?
    
    @IBAction func cancel(_ sender: UIButton) {
        delegate?.cancel()
    }
    
    @IBAction func showSleepSettingScreen(_ sender: UIButton) {
    }
}


