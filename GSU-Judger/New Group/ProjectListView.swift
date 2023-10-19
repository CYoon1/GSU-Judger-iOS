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
        NavigationStack {
            List {
                ForEach(projects, id: \.self) { _ in
                    ProjectRowView()
                }
            }
            .navigationTitle("Projects")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Log Out")
                    } label: {
                        Text("Log Out")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProjectAddView()) {
                        Label("Add Project", systemImage: "plus")
                    }
                }
            })
        }
    }
}

struct ProjectRowView: View {
    var body: some View {
        Text("Test")
    }
}

#Preview {
    ProjectListView()
}
