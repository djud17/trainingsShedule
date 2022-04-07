//
//  ViewController.swift
//  test_fitness
//
//  Created by Давид Тоноян  on 02.04.2022.
//

import UIKit

class TrainTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    let apiClient: ApiClient = ApiClientImpl()
    var trainings: Trainings?
    var dateArr: [String] = []
    var trainArr: [[Lesson]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Расписание"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadData()
    }
    
    // Загрузка данных JSON
    
    private func loadData() {
        apiClient.getTableTrain { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let allTrainings):
                    self.trainings = allTrainings
                    self.errorLabel.isHidden = true
                    self.parsingData()
                case .failure:
                    self.trainings = nil
                    self.errorLabel.isHidden = false
                }
                self.tableView.reloadData()
            }
        }
    }
    
    // Обработка полученных данных
    
    private func parsingData() {
        if let trains = trainings {
            for el in trains.lessons {
                if !(dateArr.contains(el.date)) {
                    dateArr.append(el.date)
                }
            }
            dateArr.sort() {$0 < $1}
            for (i, el) in dateArr.enumerated() {
                trainArr.append([Lesson]())
                for lesson in trains.lessons {
                    if el == lesson.date {
                        trainArr[i].append(lesson)
                    }
                }
                trainArr[i].sort() {$0.startTime < $1.startTime}
            }
        }
    }
}
