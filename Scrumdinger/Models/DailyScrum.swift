//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct DailyScrum: Identifiable, Codable {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var history: [History] = []
    let id: UUID
    
    init(title: String, attendees: [String], lengthInMinutes: Int, color: Color, history: [History] = [], id: UUID = UUID()) {
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.history = history
        self.id = id
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .init(.systemTeal)
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}

extension DailyScrum {
    mutating func recordHistory(scrumTimer: ScrumTimer) {
        let newHistory = History(attendees: attendees, lengthInMinutes: scrumTimer.secondsElapsed / 60)
        let calendar = Calendar(identifier: .gregorian)
        let newDateComponents = calendar.dateComponents([.day, .month, .year], from: newHistory.date)
        let day = newDateComponents.day
        let month = newDateComponents.month
        let year = newDateComponents.year
        
        if history.allSatisfy({
            let dateComponents = calendar.dateComponents([.day, .month, .year], from: $0.date)
            return dateComponents.day != day && dateComponents.month != month && dateComponents.year != year
        }) {
            history.insert(newHistory, at: 0)
        }
    }
}


#if DEBUG
extension DailyScrum {
    static let data = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color(.systemYellow)),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color(.systemOrange)),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color(.systemPink))
        ]
}
#endif
