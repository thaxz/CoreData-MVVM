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
                        viewModel.addBusiness()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
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
