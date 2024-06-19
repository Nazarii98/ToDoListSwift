//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import FirebaseCore
import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
