//
//  RegisterUserView.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/18/23.
//

import SwiftUI
import Firebase

struct UserRegisterView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
            Form{
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
                        //                        .textFieldStyle(.roundedBorder)
                    }
                    Button {
                        print("Attempting Register with Email: \(email), Password: \(password)")
                        register()
                    } label: {
                        Text("Register")
                    }
                }
                .navigationTitle("Register New User")
            }
        }
        
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        UserRegisterView()
    }
}
