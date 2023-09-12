//
//  CoreDataViewModel.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import Foundation
import CoreData


class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    // To store our entities
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        // linking and loading our container
        self.container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                // handle error
                print("error loading core data \(error.localizedDescription)")
            }
        }
        fetchFruits()
    }
    
    // MARK: Fetch
    func fetchFruits(){
        // creating request
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        // making the request
        do {
            // saving in a place that our views are subscribed to
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("error fetching \(error)")
        }
    }
    
    // MARK: Create
    func addFruit(text: String){
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    //MARK: SAVE
    func saveData(){
        do {
            try container.viewContext.save()
            // Calling this function again to update our published var, since we're not inside a view and arent able to use @FetchRequest to have updated in realtime
            fetchFruits()
        } catch let error {
          print("error saving \(error)")
        }
    }
}
