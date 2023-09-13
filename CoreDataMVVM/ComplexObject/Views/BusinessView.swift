//
//  BusinessView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 13/09/23.
//

import SwiftUI

struct BusinessView: View {
    let entity: BusinessEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            // If there's any department, converting the set into an array
            if let departments = entity.departments?.allObjects as? [DepartmentEntity]{
                Text("Departments: ")
                    .bold()
                ForEach(departments){ department in
                    Text(department.name ?? "")
                }
            }
            // If there's any employees, converting the set into an array
            if let employees = entity.employees?.allObjects as? [EmployeeEntity]{
                Text("Employees: ")
                    .bold()
                ForEach(employees){ employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.2).cornerRadius(10))
        .shadow(radius: 10)
    }
}

//struct BusinessView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessView()
//    }
//}
