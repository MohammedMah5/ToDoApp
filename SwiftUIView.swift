//
//  SwiftUIView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 11/08/2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Binding var todo :Todo
    var body: some View {
        
        Form {
            TextField("Title" , text:$todo.title)
            TextField ("Subtitle" , text:$todo.subtitle)
            Toggle("IsCompleted" , isOn: $todo.isCompleted)
        }.navigationTitle("Todo details ")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SwiftUIView(todo: .constant(Todo(title: "Feed the cat ")))
        }
    }
}
