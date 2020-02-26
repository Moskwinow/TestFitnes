//
//  DetailVC.swift
//  FitnessTest-Vechirko
//
//  Created by Максим Вечирко on 25.02.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
    
    
    @IBOutlet weak var textFieldView: UITextView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var model: [Model] = [] {
        willSet {
            self.model = newValue
        }
    }
    
    var index = 0 {
        willSet {
            self.index = newValue
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textFieldView.text = model[index].description
        placeLabel.text = model[index].place
        nameLabel.text = model[index].teacher
        
    }

            

}
