//
//  ContentView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 10/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    @State private var showSheet = false
    var body: some View {
        
        NavigationStack {
            List($todoManager , editActions: [.all])  { $todo in
                ToDoRowView(todo:$todo)
               
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
                NewTodoView(sourceArray: $todoManager)
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

