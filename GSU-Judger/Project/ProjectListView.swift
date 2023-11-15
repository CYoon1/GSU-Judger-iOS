//
//  ProjectListView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct ProjectListView: View {
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.presentationMode) var presentation
    let eventID: String
    
    var body: some View {
        List{
            ForEach(dataManager.projects.filter({ $0.eventID == eventID }), id: \.self) { project in
                ProjectRowView(project: project)
            }.onDelete { (indexSet) in
                dataManager.deleteProject()
            }
        }
        .navigationTitle("Projects")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ProjectAddView(eventID: eventID).environmentObject(dataManager)) {
                    Label("Open ProjectAddView()", systemImage: "plus")
                }
            }
        })
    }
}

struct ProjectRowView: View {
    let project: Project
    var body: some View {
        NavigationLink(destination: ProjectView(project: project)){
            Text("\(project.projectName)")
        }
    }
}

struct ProjectView: View {
    let project: Project
    var body: some View {
        VStack {
            Text(project.projectName)
            
            Text(project.description)
        }
    }
}

#Preview {
    NavigationStack {
        ProjectListView(eventID: "Test")
            .environmentObject(DataManager())
    }
}
