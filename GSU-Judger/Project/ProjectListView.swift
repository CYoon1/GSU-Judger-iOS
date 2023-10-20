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
    
    @State var projects : [Project] = [
        Project(projectName: "Project 1", description: "Description for Project 1"),
        Project(projectName: "Project 2", description: "Description for Project 2"),
        Project(projectName: "Project 3", description: "Description for Project 3")
    ]
    var body: some View {
        List(projects) { project in
            ProjectRowView(project: project)
        }
        .navigationTitle("Projects")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ProjectAddView()) {
                    Label("Open ProjectAddView()", systemImage: "plus")
                }
            }
            
//            ToolbarItem(placement: .bottomBar) {
//                Button {
//                    dataManager.fbSignOut()
//                    presentation.wrappedValue.dismiss()
//                } label: {
//                    Text("Sign Out")
//                }
//            }
        })
    }
}


#Preview {
    NavigationStack {
        ProjectListView()
        //        ProjectAddView()
    }
}

struct Project: Identifiable, Codable {
    var id = UUID().uuidString
    let projectName: String
    let description: String
}

struct ProjectRowView: View {
    let project: Project
    var body: some View {
        NavigationLink(destination: Text("Placeholder")){
            Text("\(project.projectName)")
        }
    }
}

struct ProjectAddView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var projectName: String = ""
    @State var description: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    ZStack {
                        Text("Name")
                    }
                    TextField(text: $projectName) {
                        Text("Enter project name here")
                    }
                }
                
                HStack {
                    TextField("Enter project description", text: $description,  axis: .vertical)
                        .lineLimit(5...10)
                }
            }
            
            Section {
                Button {
                    print("Create new project")
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Create Project")
                }
                
            }
        }
        .navigationTitle("Create new project")
    }
}

