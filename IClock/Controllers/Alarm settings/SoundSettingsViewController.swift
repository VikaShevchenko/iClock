//
//  SoundSettingsViewController.swift
//  IClock
//
//  Created by 1 on 10.10.2022.
//

import Foundation
import UIKit
import AVFoundation

class SoundSettingsViewController: UIViewController {
    
    @IBOutlet weak var soundSettingsTableView: UITableView!
    
    var bombSoundEffect: AVAudioPlayer?
    
    var vibrationSignals = ["Миттєво", "Наголос", "Оповістка", "Пульсація", "Cимфонія", "Стакато", "Швидко", "S.O.S."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Вібросигнал"
      
        
    }
}

extension SoundSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vibrationSignals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repeatCell", for: indexPath)
        
        let currentVibrationSignal = vibrationSignals[indexPath.row]
        cell.textLabel?.text = currentVibrationSignal
        return cell
    }
}


extension SoundSettingsViewController {
    private func setupTableView () {
         soundSettingsTableView.delegate = self
        soundSettingsTableView.dataSource = self
        soundSettingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "repeatCell")
    }
}


extension SoundSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            let path = Bundle.main.path(forResource: "ShieldA.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            bombSoundEffect = try! AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        case 1:
            let path = Bundle.main.path(forResource: "Spawn.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            bombSoundEffect = try! AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        case 2:
           let path = Bundle.main.path(forResource: "CollisionShield.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            bombSoundEffect = try! AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        case 3:
            let path = Bundle.main.path(forResource: "CollisionLarge.wav",
                                        ofType: nil)!
           let url = URL(fileURLWithPath: path)
            bombSoundEffect = try! AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
            
        default:
             break
        }
        
        
        // path -
      
        
    }
}

