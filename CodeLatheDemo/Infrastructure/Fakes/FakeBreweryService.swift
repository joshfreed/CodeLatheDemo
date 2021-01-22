//
//  FakeBreweryService.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/22/21.
//

import Foundation
import Combine

/// Fake implementation of the brewery service for use in testing and SwiftUI previews.
class FakeBreweryService: BreweryService {
    
    var listBreweriesByResponse: Result<[Brewery], Error>? = .success([
        .init(id: 1, name: "Dock Street Brewery", street: "701 S 50th St Fl 1"),
        .init(id: 2, name: "Evil Genius Beer Co", street: "1727 N Front St")
    ])
    
    var argCity: String = ""
    
    func listBreweriesBy(city: String) -> AnyPublisher<[Brewery], Error> {
        argCity = city
        
        if let result = listBreweriesByResponse {
            return result.publisher.eraseToAnyPublisher()
        } else {
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }
    }
    
}

enum FakeError: Error {
    case error1
}
