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
    let type: BreweryType
    
    var body: some View {
        HStack(spacing: 16) {
            BreweryImageView(breweryType: type)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.system(size: 16))
                
                Text(street)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct BreweryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryListItemView(name: "Evil Genius Beer Co", street: "1727 N Front St", type: .micro)
            .padding()
    }
}
