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
    
    init(){
        getBusiness()
    }
    
    // MARK: CRUD
    
    // Create
    func addBusiness(){
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    
    // Fetch
    func getBusiness(){
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
            business = try manager.context.fetch(request)
        } catch {
            print("error fetching business \(error.localizedDescription)")
        }
       
    }
    
    func save(){
        manager.save()
    }
    
}
