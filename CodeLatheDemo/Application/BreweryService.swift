//
//  BreweryService.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/21/21.
//

import Foundation
import Combine

protocol BreweryService {
    
    /// Lists all the breweries in the given city. The returned list is sorted by name alphabetically.
    ///
    /// - Parameter city: The city to search in.
    /// - Returns: A publisher that publishes the list of breweries once and then completes.
    func listBreweriesBy(city: String) -> AnyPublisher<[Brewery], Error>
    
}
