//
//  DepartmentView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 13/09/23.
//

import SwiftUI

struct DepartmentView: View {
    let entity: DepartmentEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            // If there's any department, converting the set into an array
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity]{
                Text("Businesses: ")
                    .bold()
                ForEach(businesses){ business in
                    Text(business.name ?? "Business without name")
                }
            }
            // If there's any employees, converting the set into an array
            if let employees = entity.employees?.allObjects as? [EmployeeEntity]{
                Text("Employees: ")
                    .bold()
                ForEach(employees){ employee in
                    Text(employee.name ?? "Employee without name")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.2).cornerRadius(10))
        .shadow(radius: 10)
    }
}

//struct DepartmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DepartmentView()
//    }
//}
