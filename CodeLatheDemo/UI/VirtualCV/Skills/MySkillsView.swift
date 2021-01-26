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
        VStack(alignment: .leading, spacing: 16) {
            Text("Skills")
                .cvSectionTitle()
            
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
