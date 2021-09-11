//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @ObservedObject private var scrumData = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrumData.scrums, saveAction: scrumData.save)
            }
            .onAppear {
                scrumData.load()
            }
        }
    }
}
