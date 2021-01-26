//
//  TagListView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

/// A view that displays a horizontal wrapping list of strings.
///
///
struct TagListView<Content: View>: View {
    /// The list of tags to display in this view.
    let tags: [String]
    /// Function that builds a view for a single tag.
    var tagViewBuilder: (String) -> Content
    
    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(tags, id: \.self) { tag in
                tagViewBuilder(tag)
                    .padding(.bottom, 16)
                    .padding(.trailing, 12)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TagListView_Previews: PreviewProvider {
    static var tags: [String] = ["HTML", "CSS", "JavaScript", "Git", "Photoshop", "Swift", "Angular", "SwiftUI", "C#"]
    static var previews: some View {
        TagListView(tags:tags) {
            Text($0)
                .padding()
                .background(Color.blue.opacity(0.4))
        }
    }
}
