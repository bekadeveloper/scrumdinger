//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct DailyScrum: Identifiable {
    
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    let id = UUID()
    
}

extension DailyScrum {
    static let data = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color.random),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color.random),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color.random)
        ]
}
