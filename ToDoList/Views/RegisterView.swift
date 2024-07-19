//
//  RegisterView.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
 
    var body: some View {
        HeaderView(
            title: "Register",
            subtitle: "Start organizing todos",
            angle: -15,
            background: .orange
        )
        
        Form {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Create Account", background: .green) {
                viewModel.register()
                print("togled create account")
            }
        }
        .frame(height: 300)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
 
