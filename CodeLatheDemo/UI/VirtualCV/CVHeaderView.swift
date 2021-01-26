//
//  CVHeaderView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct CVHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image("Arrow Left")
            }
            
            HStack(spacing: 0) {
                Spacer()
                Text("\(name)'s Virtual CV")
                    .font(.custom("Inter-SemiBold", size: 14))
                Spacer()
            }
        }
        .padding(.leading, 16)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 54)
        .background(
            Color.white.shadow(color: Color("Drop Shadow"), radius: 9, x: 0, y: 0)
        )
        .modifier(HideTopShadowViewModifier())
    }
}

struct HideTopShadowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            Color.white.frame(height: 20).offset(x: 0, y: -20)
        }
    }
}

struct CVHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CVHeaderView(name: "John Doe")
    }
}
