//
//  ContentView.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {

        VStack {

            switch (viewModel.breweries.isEmpty, viewModel.error == nil, viewModel.showActivityIndicator == false) {
            case (true, true, true):
                ButtonView(viewModel: viewModel)
            case (false, true, true):
                ListView(viewModel: viewModel)
            case (true, true, false):
                ActivityIndicatorView()
            case (true, false, true):
                Text(viewModel.error?.localizedDescription ?? "Error Retreiving data")
            default:
                Text(viewModel.error?.localizedDescription ?? "Something Went Wrong")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
