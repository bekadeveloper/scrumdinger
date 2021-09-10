//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Beka on 01/09/21.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var newScrumData = DailyScrum.Data()
    @State private var editViewIsPresented = false
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle(Text("Daily Scrums"))
        .navigationBarItems(trailing: Button(action: { editViewIsPresented.toggle() }) {
            Image(systemName: "plus.circle.fill")
        })
        .sheet(isPresented: $editViewIsPresented) {
            NavigationView {
                EditView(scrumData: $newScrumData)
                    .navigationBarItems(leading:
                                            Button("Dismiss") { editViewIsPresented = false },
                                        trailing: Button("Add") {
                                            let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                                            scrums.append(newScrum)
                                            editViewIsPresented = false })
            }
        }
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else { fatalError("Can't find scrum in array") }
        return $scrums[scrumIndex]
    }
}

#if DEBUG
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
#endif
