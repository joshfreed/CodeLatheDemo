//
//  BreweryImageView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

struct BreweryImageView: View {
    let breweryType: BreweryType
    
    var imageName: String {
        switch breweryType {
        case .nano: return "nano"
        case .micro: return "micro"
        case .brewpub: return "brewpub"
        case .regional: return "regional"
        }
    }
    
    var body: some View {
        Image(imageName)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 32, height: 32)
            .foregroundColor(Color.black.opacity(0.6))
    }
}

struct BreweryImageView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryImageView(breweryType: .nano).previewLayout(.sizeThatFits)        
        BreweryImageView(breweryType: .micro).previewLayout(.sizeThatFits)
        BreweryImageView(breweryType: .brewpub).previewLayout(.sizeThatFits)
        BreweryImageView(breweryType: .regional).previewLayout(.sizeThatFits)
    }
}
