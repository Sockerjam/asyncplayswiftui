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

            switch viewModel.brewresponse {
            case .start:
                ButtonView(viewModel: viewModel)
            case .loading:
                ActivityIndicatorView()
            case .success(let breweries):
                ListView(breweries: breweries)
            case .error(let error):
                Text(error.localizedDescription)

            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
