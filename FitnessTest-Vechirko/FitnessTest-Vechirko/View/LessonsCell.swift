//
//  LessonsCell.swift
//  FitnessTest-Vechirko
//
//  Created by Максим Вечирко on 25.02.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit

enum Week: String {
    case Monday = "Понедельник"
    case Tuesday = "Вторник"
    case Wednesday = "Среда"
    case Thursday = "Четверг"
    case Friday = "Пятница"
    case Saturday = "Суббота"
    case Sunday = "Воскресение"
}



class LessonsCell: UITableViewCell {
    
    @IBOutlet weak var nameLesson: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var time: UILabel!
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
    public func configure(withModel model: Model) {
        nameLesson.text = model.name
        day.text = String(model.weakDay)
        time.text = model.time
        
        switch day.text {
        case "1":
            day.text = Week.Monday.rawValue
        case "2":
            day.text = Week.Tuesday.rawValue
        case "3":
            day.text = Week.Wednesday.rawValue
        case "4":
            day.text = Week.Thursday.rawValue
        case "5":
            day.text = Week.Friday.rawValue
        case "6":
            day.text = Week.Saturday.rawValue
        case "7":
            day.text = Week.Sunday.rawValue
        case .none:
            break
        case .some(_):
            break
        }
        
    }
   

}
