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
    
    init() {
        // linking and loading our container
        self.container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                // handle error
                print("error loading core data \(error.localizedDescription)")
            }
        }
    }
    
}
