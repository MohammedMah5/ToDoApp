//
//  ContentView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 10/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    var body: some View {
        TabView{
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos" , systemImage: "checkmark.circle.fill")
                }
            HowManyMoreView(TodoManager: todoManager)
                .tabItem {
                    Label("Numbers of todos" , systemImage: "number.circle.fill")
                }
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

