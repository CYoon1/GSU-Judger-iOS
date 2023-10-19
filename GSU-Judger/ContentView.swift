//
//  ContentView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var showLogin : Bool = false
    
    var body: some View {
        NavigationStack {
            Group{
                if showLogin {
                    LoginView()
                } else {
                    ProjectListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showLogin.toggle()
                    } label: {
                        if showLogin {
                            Text("Debug Hide Login")
                        } else {
                            Text("Debug Show Login")
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
