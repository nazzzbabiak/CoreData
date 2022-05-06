//
//  JsonViewModel.swift
//  JSONCoreData
//
//  Created by Nazar Babyak on 04.05.2022.
//

import SwiftUI
import CoreData


class JsonViewModel: ObservableObject {
    
    @Published var results: [ResultModel] = []
    
    func saveData(context: NSManagedObjectContext) {
        
        results.forEach { (data) in
            
            let entity = Result(context: context)
            entity.username = data.username
            entity.phone = data.phone
            entity.email = data.email
            entity.website = data.website
            entity.name = data.name
        }
        do {
            
            try context.save()
            print("succses")
            
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
    
    func fetchData(context: NSManagedObjectContext) {
        
        let url = "https://jsonplaceholder.typicode.com/users"
        
        let request = URLRequest(url: URL(string: url)!)
         
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            
            guard let data = data else {
                return
            }
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                print("Bad news for you. Error:")
                return
            }
            do {
                
                let results = try JSONDecoder().decode([ResultModel].self, from: data)
                
                print(data)
                
                DispatchQueue.main.async {
                    self.results = results
                    
                    self.saveData(context: context)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}


