//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Beka on 06.09.2021.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    let skipSpeaker: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    private var isLastSpeaker: Bool {
        speakerNumber == speakers.endIndex
    }
    
    var body: some View {
        Group {
            if !isLastSpeaker {
                HStack {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipSpeaker) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                    .foregroundColor(.blue)
                }
            } else {
                Text("Last Speaker")
            }
        }
    }
}

#if DEBUG
struct MeetingFooterView_Previews: PreviewProvider {
    static let speakers = [ScrumTimer.Speaker(name: "Mark", isCompleted: false), ScrumTimer.Speaker(name: "Karla", isCompleted: false)]
    
    static var previews: some View {
        MeetingFooterView(speakers: speakers, skipSpeaker: {})
            .previewLayout(.sizeThatFits)
    }
}
#endif
