//
//  DataManager.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/20/23.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var events: [Event] = []
    
    init() {
        fetchEvents()
    }
    func fetchEvents() {
        events.removeAll()
        let db = Firestore.firestore()
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
}
