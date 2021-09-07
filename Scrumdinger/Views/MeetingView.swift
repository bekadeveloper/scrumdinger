//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct MeetingView: View {
    @EnvironmentObject var scrumTimer: ScrumTimer
    @Binding var scrum: DailyScrum
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(scrum.color)
            VStack {
                MeetingHeaderView(scrumTimer.secondsElapsed, scrumTimer.secondsRemaining, color: scrum.color)
                
                Circle()
                    .strokeBorder(lineWidth: 20)
                    .overlay(
                        VStack {
                            Text(scrumTimer.activeSpeaker)
                                .font(.title)
                                .fontWeight(.semibold)
                                .animation(.linear)
                            Text("is speaking")
                        }
                    )
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipSpeaker: scrumTimer.skipSpeaker)
            }
            .padding()
        }
        .padding()
        .padding(.vertical)
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum()
        }
    }
}

#if DEBUG
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
            .preferredColorScheme(.dark)
            .environmentObject(ScrumTimer())
    }
}
#endif
