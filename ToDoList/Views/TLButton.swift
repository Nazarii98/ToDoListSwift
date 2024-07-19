//
//  TLButton.swift
//  ToDoList
//
//  Created by Назар Чепіль on 20.06.2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Title", background: .red) {
        print("called")
    }
}
