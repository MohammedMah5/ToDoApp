//
//  ContentView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 10/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos =
    [Todo(title: "Feed") ,
     Todo(title: "Eat") ,
    Todo(title: "See") ,
     Todo(title: "bee" , isCompleted: true)]
    
    var body: some View {
        NavigationStack {
            List($todos)  { $todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
            }
            .navigationTitle("Todos")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
