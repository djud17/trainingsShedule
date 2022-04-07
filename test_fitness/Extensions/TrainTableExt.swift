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
        var sectionName = sepText[2] + " "
        
        switch sepText[1] {
        case "01": sectionName += "Января"
        case "02": sectionName += "Февраля"
        case "03": sectionName += "Марта"
        case "04": sectionName += "Апреля"
        case "05": sectionName += "Мая"
        case "06": sectionName += "Июня"
        case "07": sectionName += "Июля"
        case "08": sectionName += "Августа"
        case "09": sectionName += "Сентября"
        case "10": sectionName += "Октября"
        case "11": sectionName += "Ноября"
        case "12": sectionName += "Декабря"
        default: sectionName += ""
        }
        
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
            
            for el in trains.trainers {
                if el.id == model.coachID {
                    cell.coachNameLabel.text = el.fullName
                    break
                }
            }
            cell.flagTrainView.backgroundColor = UIColor(hex: model.color.rawValue)
            cell.startTimeLabel.text = model.startTime
            cell.endTimeLabel.text = model.endTime
            cell.trainNameLabel.text = model.name
            cell.locationNameLabel.text = model.place.rawValue
        } else {
            cell.coachNameLabel.text = ""
            cell.flagTrainView.backgroundColor = .white
            cell.startTimeLabel.text = ""
            cell.endTimeLabel.text = ""
            cell.trainNameLabel.text = ""
            cell.locationNameLabel.text = ""
        }
        return cell
    }
}
