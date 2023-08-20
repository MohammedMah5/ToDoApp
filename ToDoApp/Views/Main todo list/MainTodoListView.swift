//
//  MainTodoListView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 20/08/2023.
//

import SwiftUI

struct MainTodoListView: View {
    @ObservedObject var todoManager :TodoManager
    @State private var showSheet = false
    @State private var ShowConfirmAlert = false
    var body: some View {
        NavigationStack {
            List($todoManager.todos , editActions: [.all])  { $todo in
                ToDoRowView(todo:$todo)
               
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        ShowConfirmAlert = true
                    }label: {
                        Image(systemName: "clipboard")
                    }
                    Button {showSheet = true} label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
            }.alert("load sample data? Warning: All existing data will be deleted." , isPresented: $ShowConfirmAlert) {
                Button("Replace" , role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
