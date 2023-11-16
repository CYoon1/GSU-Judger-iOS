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
                ProjectRowView(project: project).environmentObject(dataManager)
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
    @EnvironmentObject var dataManager: DataManager
    let project: Project
    
    var body: some View {
        NavigationLink(destination: ProjectView(project: project).environmentObject(dataManager)){
            Text("\(project.projectName)")
        }
    }
}

struct ProjectView: View {
    @EnvironmentObject var dataManager: DataManager
    let project: Project
    
    var body: some View {
        Form {
            Section("Name") {
                Text(project.userName)
            }
            Section("Description") {
                Text(project.description)
            }
            Section("Rating") {
                NavigationLink(destination: RatingAddView(projectID: project.id)) {
                    RatingRowView(projectID: project.id).environmentObject(dataManager)
                }
            }
            
        }.navigationTitle(project.projectName)
    }
}

struct RatingRowView: View {
    @EnvironmentObject var dataManager: DataManager
    var averageRating: Double = 0
    let projectID: String
    
    
    @State var rating = 1
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
            }
        }.onAppear{ rating = dataManager.getAverageRatingByProjID(id: projectID) }
    }
}

struct RatingAddView: View {
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.presentationMode) var presentation
    var averageRating: Double = 0
    let projectID: String
    
    
    @State var rating = 1
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        Form {
            HStack {
                if label.isEmpty == false {
                    Text(label)
                }
                ForEach(1..<maximumRating + 1, id: \.self) { number in
                    image(for: number)
                        .foregroundColor(number > rating ? offColor : onColor)
                        .onTapGesture {
                            rating = number
                        }
                }
            }
            Button {
                let newRating = Rating(stars: rating, userID: "", projID: projectID)
                dataManager.addRating(rating: newRating)
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Confirm Rating")
            }

        }
        
    }
    
    
}

#Preview {
    NavigationStack {
        ProjectListView(eventID: "Test")
            .environmentObject(DataManager())
    }
}
