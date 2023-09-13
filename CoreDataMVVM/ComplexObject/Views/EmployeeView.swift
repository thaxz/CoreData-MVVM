//
//  EmployeeView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 13/09/23.
//

import SwiftUI

struct EmployeeView: View {
    let entity: EmployeeEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            Text("Business: ")
                .bold()
            Text(entity.business?.name ?? "Business without name")
            Text("Departments: ")
                .bold()
            Text(entity.department?.name ?? "Department without name")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.2).cornerRadius(10))
        .shadow(radius: 10)
    }
}

//struct EmployeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeView()
//    }
//}
