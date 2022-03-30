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

class ViewModel: BrewManagerDelegate, ObservableObject {


    @Published var breweries: [Breweries] = []
    @Published var error: NetworkError?
    @Published var showActivityIndicator: Bool = false

    var brewManager: BrewManager
    var delegate: ViewModelDelegate?

    init() {
        brewManager = BrewManager()
        brewManager.delegate = self
    }

    func getBreweries() {
        brewManager.requestBreweries()
        showActivityIndicator = true
    }

    func update(breweries: [Breweries]) {
        DispatchQueue.main.async {
            self.breweries = breweries
            self.showActivityIndicator = false
        }
    }

    func handle(error: NetworkError) {
        self.error = error
    }
    
}
