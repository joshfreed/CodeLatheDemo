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
    
    let cv = VirtualCV(
        name: "John Doe",
        email: "john@doe.com",
        phone: "555-123-4567",
        skills: ["HTML", "CSS", "JavaScript", "Git", "Photoshop"],
        bio: "\"John Doe\" and \"Jane Doe\" (for females) are multiple-use names that are used when the true name of a person is unknown or is being intentionally concealed. In the context of law enforcement in the United States, such names are often used to refer to a corpse whose identity is unknown or unconfirmed. Secondly, such names are also often used to refer to a hypothetical \"everyman\" in other contexts, in a manner similar to \"John Q. Public\" or \"Joe Public\". There are many variants to the above names, including \"John Roe\", \"Richard Roe\", \"Jane Roe\" and \"Baby Doe\", \"Janie Doe\" or \"Johnny Doe\" (for children)."
    )
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListBreweriesView(vm: listBreweriesViewModel)
                    .navigationBarTitle("Breweries")
                    .navigationBarItems(trailing: NavigationLink(destination: virtualCVView()) {
                        Text("Virtual CV")
                    })
            }
        }
    }
    
    private func virtualCVView() -> some View {
        VirtualCVView(cv: cv)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
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
