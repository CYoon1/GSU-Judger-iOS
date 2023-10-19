//
//  ProjectListView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct ProjectListView: View {
    @State var projects : [String] = ["1", "2", "3"]
    var body: some View {
        List {
            ForEach(projects, id: \.self) { _ in
                ProjectRowView()
            }
        }
        .navigationTitle("Projects")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ProjectAddView()) {
                    Label("Open ProjectAddView()", systemImage: "plus")
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
    }
}


#Preview {
    NavigationStack {
        ProjectListView()
    }
}

struct ProjectAddView: View {
    var body: some View {
        Text("ProjectAddView()")
    }
}

struct ProjectRowView: View {
    var body: some View {
        Text("Test")
    }
}
