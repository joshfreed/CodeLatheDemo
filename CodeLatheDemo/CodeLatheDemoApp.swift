//
//  CodeLatheDemoApp.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/21/21.
//

import SwiftUI

// MARK: - Main App

@main
struct CodeLatheDemoApp: App {
    @StateObject var listBreweriesViewModel = ListBreweriesViewModel(breweryService: Services.shared.breweryService)
    
    var body: some Scene {
        WindowGroup {
            ListBreweriesView(vm: listBreweriesViewModel)
        }
    }
}

// MARK: - Services

/// A class that contains services shared and reused. Often these will have different implentations for
/// production vs UI testing.
///
/// I'm still exploring the best ways to inject services into a full SwiftUI app while preserving the ability to sub out
/// implentations for UI testing. I've made this class fileprivate so it can't be used outside this file because I don't want
/// random views in the view hierarchy to accessing services directly. Dependencies should be passed to views via
/// the constructor or as environment objects.
////
fileprivate class Services {
    static let shared = Services()
    
    private init() {
        declareProductionServices()
        
        if ProcessInfo.processInfo.arguments.contains("UI_TESTING") {
            declareUITestingServices()
        }
    }
    
    private func declareProductionServices() {
        breweryService = HttpBreweryApi()
    }
    
    /// Use this method to override services with fakes or stubs for UI testing.
    private func declareUITestingServices() {
        breweryService = FakeBreweryService()
    }

    private(set) var breweryService: BreweryService!
}
