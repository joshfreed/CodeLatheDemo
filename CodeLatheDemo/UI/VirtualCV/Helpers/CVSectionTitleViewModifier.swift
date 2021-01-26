//
//  CVSectionTitleViewModifier.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

struct CVSectionTitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-SemiBold", size: 14))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

extension View {
    func cvSectionTitle() -> some View {
        modifier(CVSectionTitleViewModifier())
    }
}
