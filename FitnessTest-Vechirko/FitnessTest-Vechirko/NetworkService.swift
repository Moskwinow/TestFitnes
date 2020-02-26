//
//  NetworkService.swift
//  FitnessTest-Vechirko
//
//  Created by Максим Вечирко on 25.02.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit

class NetworkService {
    
   
    
    static func connect(completion: @escaping ([Model]) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        
        let session =  URLSession(configuration: configuration)
        
        let url = URL(string: "https://sample.fitnesskit-admin.ru/schedule/get_group_lessons_v2/1/")
        
        let dispatch = DispatchGroup()
        DispatchQueue.global().async(group: dispatch) {
            session.dataTask(with: url!) { (data, response, error) in
                guard let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return }
                print(json)
                let array = json as! [[String: Any]]
                let lessons = array.map { Model(json: $0)}
                
                
                dispatch.notify(queue: .main) {
                    completion(lessons)
                }
                
            }.resume()
            
        }
        
        
        
    }
    
    
    
    
}
