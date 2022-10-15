//
//  RepeatAlarmViewController.swift
//  IClock
//
//  Created by 1 on 07.10.2022.
//

import Foundation
import UIKit

class RepeatAlarmViewController: UIViewController {
    
    @IBOutlet weak var repeatAlarmTableView: UITableView!
    
    var days =  ["Щопонеділка", "Щовівторка", "Щосереди", "Щочетверга", "Щоп'ятниці", "Щосуботи", "Щонеділі"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Повторювати"
    }
}

extension RepeatAlarmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.Cell.standardCell, for: indexPath)
        
        let currentDay = days[indexPath.row]
        cell.textLabel?.text = currentDay
        return cell
        
    }
    
    
}

extension RepeatAlarmViewController {
    private func setupTableView() {
        //        repeatAlarmTableView.delegate = self
        repeatAlarmTableView.dataSource = self
        repeatAlarmTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.Cell.standardCell)
    }
    
}

