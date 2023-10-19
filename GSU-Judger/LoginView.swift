//
//  LoginView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/17/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Username")
                    TextField(text: $username) {
                        Text("Enter username here")
                    }
                }
                HStack {
                    ZStack {
                        Text("Username").hidden()
                        Text("Password")
                    }
                    SecureField(text: $password) {
                        Text("Enter password here")
                    }
                }
                Button {
                    print("Attempting Register with Username: \(username), Password: \(password)")
                } label: {
                    Text("Login")
                }
            }
            Section {
                NavigationLink {
                    RegisterUserView()
                } label: {
                    Text("Create New User")
                }
                
            }
        }
        .navigationTitle("Login")
        
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
