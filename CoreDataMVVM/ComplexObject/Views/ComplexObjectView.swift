//
//  ComplexObjectView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import SwiftUI

struct ComplexObjectView: View {
    
    @StateObject var viewModel = ComplexCoreDataViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20){
                    Button {
                        viewModel.addDepartment()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack(alignment: .top){
                            ForEach(viewModel.business){ business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack(alignment: .top){
                            ForEach(viewModel.departments){ departments in
                                DepartmentView(entity: departments)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack(alignment: .top){
                            ForEach(viewModel.employees){ employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Relationships")
    }
}

struct ComplexObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ComplexObjectView()
    }
}
