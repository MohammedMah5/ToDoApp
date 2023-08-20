//
//  ToDoRowView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 16/08/2023.
//

import SwiftUI

struct ToDoRowView: View {
    @Binding var todo:Todo
    var body: some View {
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
}


struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRowView(todo: .constant(Todo(title: "demo todo")))
    }
}
