//
//  ViewController.swift
//  FitnessTest-Vechirko
//
//  Created by Максим Вечирко on 25.02.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var program: [Model] = [] {
        willSet {
            self.program = newValue
            self.tableView.reloadData()
        }
    }
    
    var detailVC: DetailVC!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NetworkService.connect {[weak self] lessons in
            self?.program = lessons
            
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return program.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell", for: indexPath) as! LessonsCell
        let lessonModel = program[indexPath.row]
        cell.configure(withModel: lessonModel)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        self.addChild(detailVC)
        self.view.addSubview(detailVC.view)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 3.0, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.detailVC.view.transform = CGAffineTransform(translationX: 0.0 , y: -self.view.frame.width)
        }, completion: nil)
        
        detailVC.view.frame = CGRect(x: 0 , y: self.view.frame.height - self.view.frame.height / 2 , width: self.view.bounds.width , height: self.view.frame.height / 2 )
        let ind = indexPath.row
        detailVC.index = ind
        detailVC.model = program
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let vc = detailVC else {return}
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            vc.view.transform = CGAffineTransform(translationX: 0.0 , y: -self.view.frame.width)
        }) { (_) in
            vc.view.removeFromSuperview()
            
        }
    }
    
    
    
    
    
}
