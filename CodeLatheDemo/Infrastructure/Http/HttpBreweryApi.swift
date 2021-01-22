//
//  HttpBreweryApi.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/22/21.
//

import Foundation
import Combine

/// Implementation of the brwery service that loads breweries from the Open Brewery API.
class HttpBreweryApi: BreweryService {
    func listBreweriesBy(city: String) -> AnyPublisher<[Brewery], Error> {
        print("Listing breweries for \(city)")
        
        let url = URL(string: "https://api.openbrewerydb.org/breweries?by_city=\(city)&per_page=50&sort=name")!
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [HttpBreweryApi.BreweryDto].self, decoder: JSONDecoder())
            .map { $0.filter { $0.brewery_type != "planning" } }
            .map { $0.map { $0.toModel() } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension HttpBreweryApi {
    
    /// Struct that holds a single brewery object as it is received from the Open Brewery API.
    ///
    /// Properties and names will match those specified in the Open Brewery API. If their API changes,
    /// by adding or removing or renaming properties, this should be the only thing in this code that
    /// needs to change. It's important to decouple the API and it's requirements from those of this app.
    struct BreweryDto: Decodable {
        let id: Int
        let name: String
        let street: String
        let brewery_type: String
        
        /// Converts this API object to an instance of our domain model.
        func toModel() -> Brewery {
            Brewery(id: id, name: name, street: street)
        }
    }
    
}
