//
//  ContactInfoLabelStyle.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct ContactInfoLabelStyle: LabelStyle {
    let iconColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .font(.custom("Inter-Medium", size: 12))
                .foregroundColor(Color("Contact Info Title"))
        } icon: {
            configuration.icon
                .foregroundColor(iconColor)
                .font(.system(size: 16))
        }
    }
}
