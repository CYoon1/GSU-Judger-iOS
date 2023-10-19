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
//        ProjectListView()
        ProjectAddView()
    }
}

struct ProjectRowView: View {
    var body: some View {
        Text("Test")
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

