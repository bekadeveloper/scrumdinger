//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by Beka on 05.09.2021.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    let scrumColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(height: 20.0)
                .foregroundColor(scrumColor.accessibleFontColor)
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}

extension ProgressView {
    func scrumProgressViewStyle(_ color: Color) -> some View {
        return self.progressViewStyle(ScrumProgressViewStyle(scrumColor: color))
    }
}
