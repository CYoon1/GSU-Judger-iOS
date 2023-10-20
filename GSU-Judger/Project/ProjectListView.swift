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
    
    var body: some View {
        List(dataManager.projects) { project in
            ProjectRowView(project: project)
        }
//        .onAppear {
//            dataManager.fetchProjects()
//        }
        .navigationTitle("Projects")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ProjectAddView().environmentObject(dataManager)) {
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
    @EnvironmentObject var dataManager: DataManager
    
    @State var projectName: String = ""
    @State var description: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name")
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
                    let newProject = Project(projectName: projectName, description: description)
                    dataManager.addProject(project: newProject)
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Create Project")
                }
            }
        }
        .navigationTitle("Create new project")
    }
}

