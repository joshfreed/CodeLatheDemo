//
//  MySkillsView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct MySkillsView: View {
    let skills: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Skills")
                .font(.custom("Inter-SemiBold", size: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TagListView(tags: skills) {
                SkillView(skill: $0)
            }
        }
        .padding(.horizontal, 18)
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        MySkillsView(skills: ["HTML", "CSS", "JavaScript", "Git", "Photoshop", "Swift", "Angular", "SwiftUI", "C#"])
    }
}
