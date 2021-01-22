//
//  BreweryListItemView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/21/21.
//

import SwiftUI

struct BreweryListItemView: View {
    let name: String
    let street: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name).font(.title3)
            Text(street).foregroundColor(.secondary)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)        
    }
}

struct BreweryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryListItemView(name: "Evil Genius Beer Co", street: "1727 N Front St")
            .padding()
    }
}
