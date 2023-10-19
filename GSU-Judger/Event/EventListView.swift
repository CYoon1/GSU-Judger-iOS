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
            Text("EventListView")
        }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Log Out")
                    } label: {
                        Text("Log Out")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EventAddView()) {
                        Label("Open EventAddView()", systemImage: "plus")
                    }
                    Button("Add Event", systemImage: "plus") {
                        print("Go to AddEvent")
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

struct EventAddView: View {
    var body: some View {
        Text("EventAddView()")
    }
}
