//
//  GalleryView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

struct GalleryView: View {
    let images = ["user-hard-hat", "user-astronaut", "user-crown", "user-ninja"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Gallery")
                .cvSectionTitle()
                .padding(.horizontal, 18)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(images, id: \.self) {
                        GalleryImageView(image: $0)
                    }
                }
                .padding(.horizontal, 18)
                .padding(.bottom, 18) // Without this modifier the image shadows get cut off
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
