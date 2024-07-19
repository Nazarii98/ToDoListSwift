//
//  User.swift
//  ToDoList
//
//  Created by Назар Чепіль on 19.06.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
