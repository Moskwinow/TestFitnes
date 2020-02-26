//
//  Model.swift
//  FitnessTest-Vechirko
//
//  Created by Максим Вечирко on 25.02.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Foundation

class Model {
    
    var name: String = ""
   
    var teacher: String = ""
    var place: String = ""
    var time: String = ""
    var description: String = ""
    var weakDay: Int = 0
    
    init(json: [String:Any]) {
        
        self.name = json["name"] as! String
        self.teacher = json["teacher"] as! String
        self.place = json["place"] as! String
        self.time = "\(json["startTime"] as! String)"  + " - " + "\(json["endTime"] as! String)"
        self.description = json["description"] as! String
        self.weakDay = json["weekDay"] as! Int
    
    }
    
    
}
