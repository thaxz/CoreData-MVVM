//
//  SimpleCoreDataViewModel.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import Foundation
import CoreData


class SimpleCoreDataViewModel: ObservableObject {
    
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
    
    // MARK: Delete
    func deleteFruit(indexSet: IndexSet){
        // Since our fruits are displayed on a list, we're using the index set to figure out witch one is and deleting it
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    // MARK: Update
    func updateFruit(entity: FruitEntity){
        // This is a mock example on how to update values inside a entity
        // since our UI isnt complex. we're just adding an exclamation mark
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
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
