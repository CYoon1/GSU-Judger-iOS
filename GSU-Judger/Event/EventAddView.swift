//
//  EventAddView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import SwiftUI

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

#Preview {
    NavigationStack {
        EventAddView()
            .environmentObject(DataManager())
    }
}
