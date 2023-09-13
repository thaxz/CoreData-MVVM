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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ComplexObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ComplexObjectView()
    }
}
