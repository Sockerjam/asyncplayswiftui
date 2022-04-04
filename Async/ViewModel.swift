//
//  ViewModel.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import Foundation

protocol ViewModelDelegate {
    func showLoadingScreen()
    func dismissLoadingScreen()
}

enum BrewResponse {
    case start
    case success([Breweries])
    case error(NetworkError)
    case loading
}

class ViewModel: BrewManagerDelegate, ObservableObject {


    @Published var brewresponse: BrewResponse = .start

    var brewManager: BrewManager
    var delegate: ViewModelDelegate?

    init() {
        brewManager = BrewManager()
        brewManager.delegate = self
    }

    func getBreweries() {
        brewManager.requestBreweries()
        brewresponse = .loading
    }

    func update(breweries: [Breweries]) {
        DispatchQueue.main.async {
            self.brewresponse = .success(breweries)
        }
    }

    func handle(error: NetworkError) {
        DispatchQueue.main.async {
            self.brewresponse = .error(error)
        }
    }
    
}
