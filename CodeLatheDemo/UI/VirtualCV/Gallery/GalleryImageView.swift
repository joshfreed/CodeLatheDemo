//
//  GalleryImageView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

struct GalleryImageView: View {
    let image: String
    
    var body: some View {

        Image(image)
            .frame(width: 95, height: 93)
            
            // The background modifier is necessary for the shadow to appear.
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                    .shadow(color: Color("Drop Shadow"), radius: 4, x: 0, y: 4)
            )
            
            // The overlay modifier is necessary to show a border with rounded corners.
            // The default border modifier does not currently support rounded corners.
            .overlay(
                RoundedRectangle(cornerRadius: 5).stroke(Color("Gallery Image Border"))
            )
        
    }
}

struct GalleryImageView_Previews: PreviewProvider {
    static var images = ["user-ninja", "user-hard-hat", "user-crown", "user-astronaut"]
    
    static var previews: some View {
        ForEach(images, id: \.self) {
            GalleryImageView(image: $0)
                .frame(width: 125, height: 125)
                .previewLayout(.sizeThatFits)
        }
    }
}
