//
//  AlarmSettingsViewController.swift
//  IClock
//
//  Created by 1 on 28.09.2022.
//


import UIKit

protocol AlarmSettingsDelegate {
    func tapCancel()
    func tapSave(alarmTime: String, type: AlarmSettingsType)
}


enum AlarmSettingsType {
    case add, edit
}


class AlarmSettingsViewController: UIViewController {
    @IBOutlet weak var timePickerView: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var alarm: Alarm?
    var delegate: AlarmSettingsDelegate?
    var settingsType: AlarmSettingsType = .add
    
    private let alarmSoundSettings = [
        AlarmSoundSettings(name: "Повторювати", settings: ["Ніколи"]),
        AlarmSoundSettings(name: "Назва", settings: ["Cигнал"]),
        AlarmSoundSettings(name: "Звук", settings: ["Радар"])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        checkAlarm()
        checkSettingsType()
    }
    
    @IBAction func tapCancel(_ sender: UIButton) {
        delegate?.tapCancel()
    }
    @IBAction func tapSave(_ sender: UIButton) {
        delegate?.tapSave(alarmTime: textField.text!, type: settingsType)
    }
    
    @IBAction func pressDeleteButton(_ sender: UIButton) { }
}

extension AlarmSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmSoundSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.Xibs.alarmSoundSetting, for: indexPath) as! AlarmSoundSettingTableViewCell
        let currentAlarmSoundSetting = alarmSoundSettings[indexPath.row]
        cell.titleLabel.text = currentAlarmSoundSetting.name
        cell.subTitleLabel.text = currentAlarmSoundSetting.settings.first
        
        return cell
    }
}

extension AlarmSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: Constants.Identifiers.Storyboards.alarmSettings, bundle: Bundle.main)
            
            let nextViewController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.Storyboards.repeatAlarm) as! RepeatAlarmViewController
            
    //        nextViewController.timeLabel.text = time
//            self.present(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: Constants.Identifiers.Storyboards.alarmSettings, bundle: Bundle.main)
            
            let nextViewController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.Storyboards.alarmName) as! AlarmNameViewController
            
    //        nextViewController.timeLabel.text = time
//            self.present(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: Constants.Identifiers.Storyboards.alarmSettings, bundle: Bundle.main)
            
            let nextViewController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.Storyboards.soundSettings) as! SoundSettingsViewController
            
    //        nextViewCont
//            roller.timeLabel.text = time
//            self.present(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
}


extension AlarmSettingsViewController {
    private func checkAlarm() {
        if alarm != nil {
            textField.text = "\(alarm!.time)"
        } else {
            textField.text = "10.00"
        }
    }
    
    private func checkSettingsType() {
        if settingsType == .add {
            title = "Додати"
            deleteButton.isHidden = true
        } else  if settingsType == .edit {
            title = "Змінити"
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let alarmSoundSettingCell = UINib(nibName: Constants.Identifiers.Xibs.alarmSoundSetting,
                                      bundle: Bundle.main)
        tableView.register(alarmSoundSettingCell,
                           forCellReuseIdentifier: Constants.Identifiers.Cell.alarmSoundSetting)
        
        let alarmSoundSettingSwitchCell = UINib(nibName: Constants.Identifiers.Xibs.alarmSoundSettingSwitch, bundle: Bundle.main)
        tableView.register(alarmSoundSettingSwitchCell, forCellReuseIdentifier: Constants.Identifiers.Cell.alarmSoundSettingSwitch)
    }
}
