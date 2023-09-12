//
//  ContentView.swift
//  CoreDataMVVM
//
//  Created by thaxz on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoreDataViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
