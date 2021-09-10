//
//  History.swift
//  Scrumdinger
//
//  Created by Beka on 10.09.2021.
//

import Foundation

struct History: Identifiable {
    
    var attendees: [String]
    var lengthInMinutes: Int
    let date = Date()
    let id = UUID()
    
}
