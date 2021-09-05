//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Beka on 05.09.2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    init(_ secElapsed: Int, _ secRemaining: Int) {
        secondsElapsed = secElapsed
        secondsRemaining = secRemaining
    }
    
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
    }
}

#if DEBUG
struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MeetingHeaderView(5, 15)
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
