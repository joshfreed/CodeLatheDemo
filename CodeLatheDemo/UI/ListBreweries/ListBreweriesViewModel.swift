//
//  ListBreweriesViewModel.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/21/21.
//

import Foundation
import Combine

class ListBreweriesViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var isLoadingError = false
    @Published var breweries: [Brewery] = []
    
    let breweryService: BreweryService
    
    init(breweryService: BreweryService) {
        self.breweryService = breweryService
    }
    
    func listBreweries() {
        isLoading = true
        isLoadingError = false
        
        breweryService
            .listBreweriesBy(city: "Philadelphia")
            .handleEvents(receiveCompletion: { _ in
                self.isLoading = false
            })
            .catch { _ -> Just<[Brewery]> in
                self.isLoadingError = true
                return Just([])
            }
            .assign(to: &$breweries)
    }
}
