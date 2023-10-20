//
//  LoginView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/17/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    ZStack {
                        Text("Password").hidden()
                        Text("Email")
                    }
                    TextField(text: $email) {
                        Text("Enter email here")
                    }
                }
                HStack {
                    Text("Password")
                    SecureField(text: $password) {
                        Text("Enter password here")
                    }
                }
                Button {
                    print("Attempting Log in with Email: \(email), Password: \(password)")
                    login()
                } label: {
                    Text("Login")
                }
            }
            Section {
                NavigationLink {
                    UserRegisterView()
                } label: {
                    Text("Create New User")
                }
                
            }
        }
        .navigationTitle("Login")
        
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
