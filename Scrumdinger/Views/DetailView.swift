//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Beka on 02/09/21.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "mic.fill")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .accessibilityLabel(Text("Start meeting"))
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
                        
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person.fill")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .navigationTitle(Text(scrum.title))
        .foregroundColor(.black)
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") { isPresented.toggle() })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(scrum.data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") { isPresented = false },
                                        trailing: Button("Done") { isPresented = false })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
//        .preferredColorScheme(.dark)
    }
}
