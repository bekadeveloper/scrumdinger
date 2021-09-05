//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(scrum.color)
            VStack {
                MeetingHeaderView(5, 10)
                
                Circle()
                    .strokeBorder(lineWidth: 20)
                
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

#if DEBUG
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
//            .preferredColorScheme(.dark)
    }
}
#endif
