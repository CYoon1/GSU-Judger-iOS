//
//  EventListView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct EventListView: View {
    var body: some View {
        List {
            NavigationLink(destination: ProjectListView()) {
                Text("EventListView")
            }
            
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
        //        EventAddView()
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
                        Text("Enter event here")
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
