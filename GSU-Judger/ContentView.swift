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
                                    dataManager.fbSignOut()
                                } label: {
                                    Text("Sign Out")
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
}

#Preview {
    ContentView()
}
