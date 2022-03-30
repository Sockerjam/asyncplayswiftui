//
//  UserManager.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import Foundation

protocol BrewManagerDelegate {
    func update(breweries: [Breweries])
    func handle(error: NetworkError)
}

class BrewManager {

    var delegate: BrewManagerDelegate?

    func requestBreweries() {
        Task {
            let brewData = await NetworkRequest.getBreweries(model: Breweries.self)

            switch brewData {
            case .success(let breweries):
                delegate?.update(breweries: breweries)
            case .failure(let networkError):
                delegate?.handle(error: networkError)
            }
        }
    }
}


