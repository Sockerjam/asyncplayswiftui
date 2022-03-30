//
//  NetworkRequest.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingFailed
}

enum NetworkRequest {

    static func getBreweries<T: Decodable>(model: T.Type) async -> Result<[T], NetworkError> {

        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            return .failure(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([T].self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(.decodingFailed)
        }

    }
    
}
