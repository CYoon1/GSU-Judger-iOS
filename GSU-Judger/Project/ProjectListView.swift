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

struct ProjectRowView: View {
    let project: Project
    var body: some View {
        NavigationLink(destination: Text("Placeholder")){
            Text("\(project.projectName)")
        }
    }
}

#Preview {
    NavigationStack {
        ProjectListView()
            .environmentObject(DataManager())
    }
}
