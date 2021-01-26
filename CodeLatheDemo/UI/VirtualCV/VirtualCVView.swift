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
            MyBioView(bio: cv.bio)
            GalleryView()
            Spacer()
        }
    }
}

struct VirtualCVView_Previews: PreviewProvider {
    static var model = VirtualCV(
        name: "John Doe",
        email: "john@doe.com",
        phone: "555-123-4567",
        skills: ["HTML", "CSS", "JavaScript", "Git", "Photoshop"],
        bio: "\"John Doe\" and \"Jane Doe\" (for females) are multiple-use names that are used when the true name of a person is unknown or is being intentionally concealed. In the context of law enforcement in the United States, such names are often used to refer to a corpse whose identity is unknown or unconfirmed. Secondly, such names are also often used to refer to a hypothetical \"everyman\" in other contexts, in a manner similar to \"John Q. Public\" or \"Joe Public\". There are many variants to the above names, including \"John Roe\", \"Richard Roe\", \"Jane Roe\" and \"Baby Doe\", \"Janie Doe\" or \"Johnny Doe\" (for children)."
    )
    
    static var previews: some View {
        VirtualCVView(cv: model)
    }
}
