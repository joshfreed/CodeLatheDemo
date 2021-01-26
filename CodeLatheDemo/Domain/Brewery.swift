//
//  Brewery.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/22/21.
//

import Foundation

struct Brewery: Identifiable, Equatable {
    let id: Int
    let name: String
    let street: String
    let type: BreweryType
}

enum BreweryType: String {
    case nano, micro, brewpub, regional
}
