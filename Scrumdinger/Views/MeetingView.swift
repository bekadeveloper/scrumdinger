//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @EnvironmentObject private var scrumTimer: ScrumTimer
    @Binding var scrum: DailyScrum
    
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
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
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
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
