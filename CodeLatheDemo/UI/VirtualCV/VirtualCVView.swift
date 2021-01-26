//
//  VirtualCVView.swift
//  CodeLatheDemo
//
//  Created by Josh Freed on 1/25/21.
//

import SwiftUI

struct VirtualCVView: View {
    let cv: VirtualCV
    
    var body: some View {
        VStack(spacing: 18) {
            CVHeaderView(name: cv.name)
            MyInfoView(name: cv.name, email: cv.email, phone: cv.phone)
            MySkillsView(skills: cv.skills)
            Spacer()
        }
    }
}

struct VirtualCVView_Previews: PreviewProvider {
    static var model = VirtualCV(
        name: "John Doe",
        email: "john@doe.com",
        phone: "555-123-4567",
        skills: ["HTML", "CSS", "JavaScript", "Git", "Photoshop"]
    )
    
    static var previews: some View {
        VirtualCVView(cv: model)
    }
}
