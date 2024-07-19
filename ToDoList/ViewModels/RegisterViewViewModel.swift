//
//  RegisterViewViewModels.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            self?.createDefaultTodoItem(userId: userId, text: "В тебе чарівна посмішка")
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, email: email, name: name, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    private func createDefaultTodoItem(userId: String, text: String) {
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: text,
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }

    
    func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
