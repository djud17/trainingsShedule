//
//  CustomCell.swift
//  test_fitness
//
//  Created by Давид Тоноян  on 04.04.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var backCellView: UIView!
    @IBOutlet weak var flagTrainView: UIView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var trainNameLabel: UILabel!
    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backCellView.layer.masksToBounds = true
        backCellView.layer.cornerRadius = 10
        backCellView.layer.borderWidth = 0.5
        backCellView.layer.borderColor = UIColor.gray.cgColor
        backCellView.layer.backgroundColor = UIColor.white.cgColor
    }
}
