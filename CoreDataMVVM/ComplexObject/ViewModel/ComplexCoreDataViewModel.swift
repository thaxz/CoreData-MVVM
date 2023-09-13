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
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init(){
        getBusiness()
        getDepartments()
        getEmployees()
    }
    
    // MARK: CRUD
    
    // Create
    func addBusiness(){
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Facebook"
//        newBusiness.departments = [departments[0], departments[1]]
//        newBusiness.employees = [employees[2]]
        save()
    }
    
    func addDepartment(){
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Finance"
        // 1 to N, so its an set
        newDepartment.businesses = [business[0], business[1], business[2]]
        newDepartment.addToEmployees(employees[2])
        save()
    }
    
    func addEmployee(){
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.name = "Swift"
        newEmployee.age = 130
        newEmployee.dateJoined = Date()
        // 1 to 1, so its only one entity
//        newEmployee.business = business[0]
//        newEmployee.department = departments[0]
        save()
    }
    
    // Fetch
    func getBusiness(){
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        let predicate = NSPredicate(format: "name == %@", "Apple")
        request.predicate = predicate
        do {
            business = try manager.context.fetch(request)
        } catch {
            print("error fetching business \(error.localizedDescription)")
        }
    }
    
    func getDepartments(){
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        do {
            departments = try manager.context.fetch(request)
        } catch {
            print("error fetching departments \(error.localizedDescription)")
        }
    }
    
    func getEmployees(){
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        do {
            employees = try manager.context.fetch(request)
        } catch {
            print("error fetching employees \(error.localizedDescription)")
        }
    }
    
    func getEmployees(for business: BusinessEntity){
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        let filter = NSPredicate(format: "business == %@", business)
        request.predicate = filter
        do {
            employees = try manager.context.fetch(request)
        } catch {
            print("error fetching employees \(error.localizedDescription)")
        }
    }
    
    // Delete
    
    func deleteDepartment(){
        let department = departments[1]
        manager.context.delete(department)
        save()
    }
    
    func save(){
        business.removeAll()
        departments.removeAll()
        employees.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusiness()
            self.getDepartments()
            self.getEmployees()
        }
        
    }
    
}
