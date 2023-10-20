//
//  EventListView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct EventListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        List(dataManager.events) { event in
            EventRowView(event: event)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: EventAddView().environmentObject(dataManager)) {
                    Label("Open EventAddView()", systemImage: "plus")
                }
            }
        })
        .navigationTitle("Event List")
    }
}

#Preview {
    NavigationStack {
        EventListView()
            .environmentObject(DataManager())
    }
}
struct Event: Identifiable, Codable {
    var id = UUID().uuidString
    let eventName: String
    let location: String
    let eventDate: Date
}

struct EventRowView: View {
    @EnvironmentObject var dataManager: DataManager
    let event: Event
    var body: some View {
        NavigationLink(destination: ProjectListView().environmentObject(dataManager)) {
            Text("\(event.eventName)")
        }
    }
}

struct EventAddView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var dataManager: DataManager
    
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
                    TextField(text: $location) {
                        Text("Enter event name here")
                    }
                }
                DatePicker("Event Date", selection: $eventDate, in: Date.now..., displayedComponents: .date)
            }
            Section {
                Button {
                    print("Create Event")
                    let newEvent = Event(eventName: eventName, location: location, eventDate: eventDate)
                    dataManager.addEvent(event: newEvent)
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Create Event")
                }
                
            }
        }
        .navigationTitle("Create New Event")
    }
}
