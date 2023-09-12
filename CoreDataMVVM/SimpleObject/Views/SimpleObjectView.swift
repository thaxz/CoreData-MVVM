//
//  SimpleObjectView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import SwiftUI

struct SimpleObjectView: View {
    @StateObject var viewModel = SimpleCoreDataViewModel()
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 20){
                TextField("Add fruits here", text: $text)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
                Button {
                    guard !text.isEmpty else {return}
                    viewModel.addFruit(text: text)
                    text = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                List {
                    ForEach(viewModel.savedEntities){ entity in
                        Text(entity.name ?? "NO NAME")
                            .onTapGesture {
                                viewModel.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                } .listStyle(.plain)
            }
            .padding(.horizontal)
            .navigationTitle("Fruits")
        }
    }
}

struct SimpleObjectView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleObjectView()
    }
}
