//
//  SkillView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct SkillView: View {
    let skill: String
    
    var body: some View {
        Text(skill)
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 20)
            .font(.custom("Inter-SemiBold", size: 12))
            .background(Color("Skill Background"))
            .foregroundColor(.white)
            .cornerRadius(16)
            .shadow(color: Color("Drop Shadow"), radius: 4, x: 0, y: 4)
    }
}

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView(skill: "HTML")
    }
}
