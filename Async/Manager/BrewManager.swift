//
//  UserManager.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import Foundation
import Combine

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
            } catch NetworkError.badURL {
                delegate?.handle(error: .badURL)
            } catch NetworkError.decodingFailed {
                delegate?.handle(error: .decodingFailed)
            } catch NetworkError.badResponse {
                delegate?.handle(error: .badResponse)
            }

        }
    }

    func brewPublisher() -> AnyPublisher<[Breweries], NetworkError> {

        Future { promise in
            Task {
                do {
                    let brewData = try await NetworkRequest.getBreweries(model: Breweries.self)
                    promise(.success(brewData))
                } catch NetworkError.badURL {
                    promise(.failure(NetworkError.badURL))
                } catch NetworkError.decodingFailed {
                    promise(.failure(NetworkError.decodingFailed))
                } catch NetworkError.badResponse {
                    promise(.failure(NetworkError.badResponse))
                } catch {
                    promise(.failure(NetworkError.noInternet))
                }
            }
        }.eraseToAnyPublisher()
    }
}


