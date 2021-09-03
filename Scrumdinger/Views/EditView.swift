//
//  EditView.swift
//  Scrumdinger
//
//  Created by Beka on 03.09.2021.
//

import SwiftUI

struct EditView: View {
    @State private var scrumData: DailyScrum.Data
    @State private var newAttendee: String = ""
    
    init(_ scrumData: DailyScrum.Data = DailyScrum.Data()) {
        self.scrumData = scrumData
    }
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 0.1) {
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes))")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person.fill")
                }
                .onDelete { indexSet in
                    scrumData.attendees.remove(atOffsets: indexSet)
                }
                HStack {
                    TextField("Add attendee", text: $newAttendee)
                    Button {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
