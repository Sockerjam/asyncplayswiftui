//
//  ViewModel.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import Foundation
import Combine

enum BrewResponse {
    case start
    case success([Breweries])
    case error(NetworkError)
    case loading
}

class ViewModel: BrewManagerDelegate, ObservableObject {


    @Published var brewresponse: BrewResponse = .start

    var cancellables = Set<AnyCancellable>()

    var brewManager: BrewManager

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

    func getBrews() {
        brewManager.brewPublisher()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.brewresponse = .error(error)
                case .finished:
                    print("Completed")
                }
            } receiveValue: { breweries in
                self.brewresponse = .success(breweries)
            }.store(in: &cancellables)

    }
    
}
