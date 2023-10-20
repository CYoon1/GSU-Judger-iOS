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

struct EventRowView: View {
    @EnvironmentObject var dataManager: DataManager
    let event: Event
    var body: some View {
        NavigationLink(destination: ProjectListView().environmentObject(dataManager)) {
            Text("\(event.eventName)")
        }
    }
}

#Preview {
    NavigationStack {
        EventListView()
            .environmentObject(DataManager())
    }
}
