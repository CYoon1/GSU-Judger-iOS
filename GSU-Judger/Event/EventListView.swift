//
//  EventListView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct EventListView: View {
    @State var events : [Event] = [
        Event(eventName: "Event 1", location: "Atlanta", eventDate: Date()),
        Event(eventName: "Event 2", location: "Atlanta", eventDate: Date()),
        Event(eventName: "Event 3", location: "Atlanta", eventDate: Date()),
    ]
    var body: some View {
        List(events) { event in
            EventRowView(event: event)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: EventAddView()) {
                    Label("Open EventAddView()", systemImage: "plus")
                }
            }
            // Temp Button
            ToolbarItem(placement: .bottomBar) {
                Button {
                    print("Log Out")
                } label: {
                    Text("Log Out")
                }
            }
        })
        .navigationTitle("Event List")
    }
}

#Preview {
    NavigationStack {
        EventListView()
    }
}
struct Event: Identifiable, Codable {
    var id = UUID().uuidString
    let eventName: String
    let location: String
    let eventDate: Date
}

struct EventRowView: View {
    let event: Event
    var body: some View {
        NavigationLink(destination: ProjectListView()) {
            Text("\(event.eventName)")
        }
    }
}

struct EventAddView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var eventName: String = ""
    @State var location: String = ""
    @State var eventDate: Date = Date()
    
    var body: some View {
        Form {
            Section {
                HStack {
                    ZStack {
                        Text("Location").hidden()
                        Text("Name")
                    }
                    TextField(text: $eventName) {
                        Text("Enter event here")
                    }
                }
                HStack {
                    Text("Location")
                    TextField(text: $eventName) {
                        Text("Enter event name here")
                    }
                }
                DatePicker("Event Date", selection: $eventDate, in: Date.now..., displayedComponents: .date)
            }
            Section {
                Button {
                    print("Create Event")
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Create Event")
                }
                
            }
        }
        .navigationTitle("Create New Event")
    }
}
