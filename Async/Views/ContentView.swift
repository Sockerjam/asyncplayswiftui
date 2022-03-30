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

            if viewModel.breweries.isEmpty && viewModel.error == nil && viewModel.showActivityIndicator == false {
                ButtonView(viewModel: viewModel)
            } else if !viewModel.breweries.isEmpty && viewModel.showActivityIndicator == false {
                ListView(viewModel: viewModel)
            } else if viewModel.showActivityIndicator {
                ActivityIndicatorView()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
