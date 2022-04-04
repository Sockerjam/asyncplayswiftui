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
    case badResponse
}

enum NetworkRequest {

    static func getBreweries<T: Decodable>(model: T.Type) async throws -> [T] {

        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.badResponse }

        guard let decodedData = try? JSONDecoder().decode([T].self, from: data) else { throw NetworkError.decodingFailed }

        return decodedData

    }
    
}
