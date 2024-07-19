//
//  ContentView.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId).tabItem {
                Label("Home", systemImage: "house")
            }
            
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
