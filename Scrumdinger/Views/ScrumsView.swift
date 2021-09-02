//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color.opacity(0.8))
            }
        }
        .navigationTitle(Text("Daily Scrums"))
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus.circle.fill")
        })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
