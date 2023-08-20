//
//  HowManyMoreView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 20/08/2023.
//

import SwiftUI

struct HowManyMoreView: View {
    @ObservedObject var TodoManager:TodoManager
    var numTodosDone: Int {
        TodoManager.todos.filter {
            $0.isCompleted
        }.count
    }
    var numTodosNotDone: Int {
        TodoManager.todos.filter {
            $0.isCompleted
        }.count
    }
    var body: some View {
        VStack {
            Text("You have completed ^[\(numTodosDone) todos](inflect:true)!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("You have ^[\(numTodosDone) todos](inflect:true) left")
                .padding()
        }
            
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(TodoManager: TodoManager())
    }
}
