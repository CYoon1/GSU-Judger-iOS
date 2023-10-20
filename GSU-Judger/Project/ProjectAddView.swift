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

#Preview {
    NavigationStack {
        ProjectAddView()
            .environmentObject(DataManager())
    }
}
