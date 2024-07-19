//
//  LoginView.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
 
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To Do List", 
                    subtitle: "Get things done",
                    angle: 15, 
                    background: .pink
                )
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                     
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                .frame(height: 300)
                .offset(y: -50)
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
