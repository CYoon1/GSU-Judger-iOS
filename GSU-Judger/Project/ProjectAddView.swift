//
//  ProjectAddView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import SwiftUI

struct ProjectAddView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var dataManager: DataManager
    let eventID: String
    
    @State var projectName: String = ""
    @State var userName: String = ""
    @State var description: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Project Name")
                    TextField(text: $projectName) {
                        Text("Enter project name here")
                    }
                }
                
                HStack {
                    Text("Your Name")
                    TextField(text: $userName) {
                        Text("Enter submitter name here")
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
                    let newProject = Project(projectName: projectName, userName: "", description: description, eventID: eventID)
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

#Preview {
    NavigationStack {
        ProjectAddView(eventID: "Test")
            .environmentObject(DataManager())
    }
}
