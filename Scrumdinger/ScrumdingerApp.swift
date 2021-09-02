//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
