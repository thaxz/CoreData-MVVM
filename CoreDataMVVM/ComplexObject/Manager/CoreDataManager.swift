//
//  CoreDataManager.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // Persistence objects
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init(){
        container = NSPersistentContainer(name: "ComplexContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    // MARK: Save
    func save(){
        do {
            try context.save()
        } catch(let error){
            print("Error saving core data \(error.localizedDescription)")
        }
    }
    
    
}
