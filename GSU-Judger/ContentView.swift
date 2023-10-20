//
//  ContentView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/17/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var userIsLoggedIn : Bool = false
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationStack {
            Group{
                if userIsLoggedIn {
                    EventListView()
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button {
                                    fbSignOut()
                                } label: {
                                    if userIsLoggedIn {
                                        Text("Debug Hide Login")
                                    } else {
                                        Text("Debug Show Login")
                                    }
                                }
                            }
                        }
                        .environmentObject(dataManager)
                } else {
                    LoginView()
                }
            }
            
            
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedIn = true
                } else {
                    userIsLoggedIn = false
                }
            }
        }
    }
    func fbSignOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

#Preview {
    ContentView()
}
