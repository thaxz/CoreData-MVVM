//
//  ComplexCoreDataViewModel.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import Foundation
import CoreData

class ComplexCoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.shared
    
    //MARK: Stored entities
    @Published var business: [BusinessEntity] = []
    
    
    // MARK: CRUD
    
    // Create
    func addBusiness(){
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    
    func save(){
        manager.save()
    }
    
}
