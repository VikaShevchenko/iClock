//
//  AlarmViewController.swift
//  IClock
//
//  Created by 1 on 23.09.2022.
//

import UIKit

class AlarmViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var alarms = [Alarm(time: 8, signalName: "Dog Song", isOn: true),
                  Alarm(time: 4, signalName: "Birds Song", isOn: true)
    ]
    
    lazy var alarmsSection = [[Alarm(time: 3, signalName: "asd", isOn: false)],alarms]
    
    
    @IBAction func showAlarmDetailsScreen( _ sender: UIButton) {
        presentAlarmSettings(type: .add)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let alarmSettingsCell = UINib(nibName: Constants.Identifiers.Xibs.alarmSettings,
                                      bundle: Bundle.main)
        tableView.register(alarmSettingsCell,
                           forCellReuseIdentifier: Constants.Identifiers.Cell.alarmSettings)
        
        let alarmCell = UINib(nibName: Constants.Identifiers.Xibs.alarm,
                              bundle: Bundle.main)
        tableView.register(alarmCell,
                           forCellReuseIdentifier: Constants.Identifiers.Cell.alarm)
    }
    
    private func presentSleepSettingPreviewScreen() {
        let storyboard = UIStoryboard(name: "SleepSettings", bundle: Bundle.main)
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.Storyboards.sleepSettings) as! SleepSettingsPreviewViewController
        
        nextViewController.delegate = self
        
        let navController = UINavigationController(rootViewController: nextViewController)
        
        navController.modalPresentationStyle = .pageSheet
        
        self.present(navController, animated:true, completion:nil)
    }
  
    private func presentAlarmSettings(alarm: Alarm? = nil, type: AlarmSettingsType) {
        //        let alarm = Alarm(time: 10, signalName: "Cat song", isOn: false)
        //        alarmsSection[1].append(alarm)
        //        tableView.reloadData()
        
        let storyboard = UIStoryboard(name: Constants.Identifiers.Storyboards.alarmSoundSettings, bundle: Bundle.main)
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.Storyboards.alarmSoundSettings) as! AlarmSettingsViewController
        
        nextViewController.alarm = alarm
        nextViewController.delegate = self
        nextViewController.settingsType = type
        
        
        let navController = UINavigationController(rootViewController: nextViewController) //Add navigation controller
        navController.modalPresentationStyle = .pageSheet
        
        self.present(navController, animated:true, completion:nil)
    }
}

extension AlarmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmsSection[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return alarmsSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.Cell.alarmSettings, for: indexPath) as! AlarmSleepSettingsTableViewCell
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.Cell.alarm, for: indexPath) as! AlarmTableViewCell
            
        let currentAlarm = alarmsSection[indexPath.section][indexPath.row]
        
            cell.timeLabel.text = "\(currentAlarm.time)"
            cell.signalNameLabel.text = "\(currentAlarm.signalName)"
            cell.alarmSwitcher.isOn = currentAlarm.isOn
            
            return cell
    }
}


extension AlarmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 140
            
        default:
            return 130
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let currrentAlarm = alarms[indexPath.row]
        
        presentAlarmSettings(alarm: currrentAlarm, type: .edit)
        
    }
    
    
    func tableView(
        _ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
} 

extension AlarmViewController: AlarmSettingsDelegate {
    func tapSave(alarmTime: String,type: AlarmSettingsType) {
        dismiss(animated: true)
        guard let time = Double(alarmTime) else { return } // перевіряєм чи юзер букви не уввів.
        
        switch type {
        case .add:
            let alarm = Alarm(time: time, signalName: "Max song", isOn: true)
            alarmsSection[1].append(alarm)
        case .edit:
            alarmsSection[1][0].time = time
        }
        
        tableView.reloadData()
    }
    
    func tapCancel() {
        dismiss(animated: true)
    }
}


extension AlarmViewController: AlarmSleepSettingsTableViewCellDelegate {
    func showSleepSettingsScreen() {
        presentSleepSettingPreviewScreen()
    }
    

}

extension AlarmViewController: SleepSettingsPreviewDelegate {
    func cancel() {
        dismiss(animated: true)
    }
    
  

}
