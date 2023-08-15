//
//  ContentView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 10/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos =
    [Todo(title: "Feed" , subtitle: "Hello") ,
     Todo(title: "Eat") ,
    Todo(title: "See") ,
     Todo(title: "bee" , isCompleted: true)]
    @State private var showSheet = false
    var body: some View {
        
        NavigationStack {
            List($todos , editActions: [.all])  { $todo in
                NavigationLink {SwiftUIView(todo: $todo)}label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        VStack (alignment: .leading) {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .strikethrough(todo.isCompleted)
                            }
                        }
                    }
                }
               
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {showSheet = true} label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todos)
                    .presentationDetents([.medium])
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
