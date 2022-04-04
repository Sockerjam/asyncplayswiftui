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
            do {
                let brewData = try await NetworkRequest.getBreweries(model: Breweries.self)
                delegate?.update(breweries: brewData)
            } catch {
                delegate?.handle(error: error as! NetworkError)
            }



        }
    }
}


