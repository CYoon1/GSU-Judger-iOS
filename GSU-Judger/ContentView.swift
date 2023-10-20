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
    
    var body: some View {
        NavigationStack {
            Group{
                if userIsLoggedIn {
                    EventListView()
                } else {
                    LoginView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        userIsLoggedIn.toggle()
                    } label: {
                        if userIsLoggedIn {
                            Text("Debug Hide Login")
                        } else {
                            Text("Debug Show Login")
                        }
                    }
                }
            }
            
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
