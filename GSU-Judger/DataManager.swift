//
//  DataManager.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var events: [Event] = []
    @Published var projects: [Project] = []
    
    func fbSignOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    init() {
        fetchEvents()
        fetchProjects()
    }
    func fetchEvents() {
        events.removeAll()
        let ref = db.collection("Events")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    
                    let eventName = data["eventName"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let rawTimestamp = data["eventDate"] as! Timestamp
                    let eventDate = rawTimestamp.dateValue()
                    
                    let event = Event(id: id, eventName: eventName, location: location, eventDate: eventDate)
                    self.events.append(event)
                }
            }
        }
    }
    func addEvent(event: Event) {
        let ref = db.collection("Events").document(event.id)
        ref.setData(["eventName" : event.eventName, "id" : event.id, "location" : event.location, "eventDate" : Timestamp(date: event.eventDate)]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchEvents() // Refresh View
    }
    func deleteEvent() {
        
    }
    
    func fetchProjects() {
        projects.removeAll()
        let ref = db.collection("Projects")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    
                    let name = data["name"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    
                    let project = Project(id: id, projectName: name, description: description)
                    self.projects.append(project)
                }
            }
        }
    }
    func addProject(project: Project) {
        let ref = db.collection("Projects").document(project.id)
        ref.setData(["name" : project.projectName, "id" : project.id, "description" : project.description]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchProjects() // Refresh View
    }
    func deleteProject() {  }
}
