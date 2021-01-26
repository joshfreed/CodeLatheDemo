//
//  ListBreweriesView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/21/21.
//

import SwiftUI

struct ListBreweriesView: View {
    @ObservedObject var vm: ListBreweriesViewModel
    
    var body: some View {        
        Group {
            if vm.isLoading {
                ProgressView { Text("Loading...") }
            } else if vm.isLoadingError {
                ListBreweriesErrorView { vm.listBreweries() }
            } else {
                List(vm.breweries) { brewery in
                    BreweryListItemView(name: brewery.name, street: brewery.street, type: brewery.type)
                        .padding([.top, .bottom], 8)
                }
            }
        }                
        .listStyle(PlainListStyle())
        .onAppear {
            vm.listBreweries()
        }
    }
}

struct ListBreweriesErrorView: View {
    var tryAgain: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Oh no! There was an error loading the breweries :(")
                .multilineTextAlignment(.center)
            
            Button(action: { tryAgain() }) {
                Text("Try Again")
            }
            
        }.padding()
    }
}

struct ListBreweriesView_Previews: PreviewProvider {
    static var previews: some View {
        ListBreweriesView(vm: makeViewModel())
    }
    
    static func makeViewModel() -> ListBreweriesViewModel {
        let breweryService = FakeBreweryService()
        
        // Uncomment this to see how the view looks while loading. Request never complets.
        //breweryService.listBreweriesByResponse = nil
        
        // Uncomment this to see how the view looks if there was an error loading breweries.
        //breweryService.listBreweriesByResponse = .failure(FakeError.error1)
        
        return ListBreweriesViewModel(breweryService: breweryService)
    }
}
