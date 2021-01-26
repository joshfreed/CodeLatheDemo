//
//  MyInfoView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct MyInfoView: View {
    let name: String
    let email: String
    let phone: String
    
    var body: some View {
        HStack(spacing: 0) {
            Color.clear.frame(width: 19, height: 1)
            
            Image("Headshot")
            
            Color.clear.frame(width: 19, height: 1)
            
            Text(name)
                .font(.custom("Inter-Medium", size: 18))
            
            Color.clear.frame(width: 25, height: 1)
            
            Divider().frame(height: 49)
            
            Color.clear.frame(width: 18.25, height: 1)
            
            VStack(spacing: 12) {
                Label(email, systemImage: "envelope")
                    .labelStyle(ContactInfoLabelStyle(iconColor: Color("Email Label Icon")))
                Label(phone, systemImage: "phone")
                    .labelStyle(ContactInfoLabelStyle(iconColor: Color("Phone Label Icon")))
            }
            
            Spacer()
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView(name: "John Doe", email: "john@doe.com", phone: "555-123-4567")
    }
}
