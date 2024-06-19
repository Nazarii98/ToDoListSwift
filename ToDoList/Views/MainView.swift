//
//  ContentView.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        VStack{
            NavigationView{
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
