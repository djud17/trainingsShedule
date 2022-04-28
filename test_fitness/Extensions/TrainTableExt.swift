//
//  TrainTableExt.swift
//  test_fitness
//
//  Created by Давид Тоноян  on 07.04.2022.
//

import UIKit

extension TrainTableViewController: UITableViewDataSource {    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sepText = dateArr[section].components(separatedBy: "-")
        let sectionName = sepText[2] + " " + (monthDict[sepText[1]] ?? "")
        
        tableView.backgroundColor = .white
        tableView.sectionHeaderHeight = 20
        
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainCell") as! CustomCell
        
        if let trains = trainings {
            let model = trainArr[indexPath.section][indexPath.row]
            
            for el in trains.trainers where el.id == model.coachID {
                cell.coachNameLabel.text = el.fullName
                break
            }
            setData(cell, model)
        } else {
            setEmptyData(cell)
        }
        return cell
    }
    
    func setData(_ cell: CustomCell,_ model: Lesson) {
        cell.flagTrainView.backgroundColor = UIColor(hex: model.color.rawValue)
        cell.startTimeLabel.text = model.startTime
        cell.endTimeLabel.text = model.endTime
        cell.trainNameLabel.text = model.name
        cell.locationNameLabel.text = model.place.rawValue
    }
    
    func setEmptyData(_ cell: CustomCell) {
        cell.coachNameLabel.text = ""
        cell.flagTrainView.backgroundColor = .white
        cell.startTimeLabel.text = ""
        cell.endTimeLabel.text = ""
        cell.trainNameLabel.text = ""
        cell.locationNameLabel.text = ""
    }
}
