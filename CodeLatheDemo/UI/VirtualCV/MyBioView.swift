//
//  MyBioView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/26/21.
//

import SwiftUI

struct MyBioView: View {
    let bio: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Bio")
                .cvSectionTitle()
            
            Text(bio)
                .font(.custom("Inter-Medium", size: 12))
        }
        .padding(.horizontal, 18)
    }
}

struct MyBioView_Previews: PreviewProvider {
    static var previews: some View {
        MyBioView(bio: "In west Philadelphia born and raised, On the playground was where I spent most of my days. Chillin' out maxin' relaxin' all cool And all shootin some b-ball outside of the school. When a couple of guys who were up to no good Started making trouble in my neighborhood I got in one little fight and my mom got scared She said 'You're movin' with your auntie and uncle in Bel Air'")
    }
}
