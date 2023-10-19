//
//  RegisterUserView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI

struct UserAddView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        Form{
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
                        Text("Email")
                    }
                    TextField(text: $email) {
                        Text("Enter email here")
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
                    //                        .textFieldStyle(.roundedBorder)
                }
                Button {
                    print("Attempting Register with Username: \(username), Email: \(email), Password: \(password)")
                } label: {
                    Text("Register")
                }
            }
        }
        .navigationTitle("Register New User")
    }
}

#Preview {
    NavigationStack {
        UserAddView()
    }
}
