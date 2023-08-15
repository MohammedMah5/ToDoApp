//
//  NewTodoView.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 11/08/2023.
//

import SwiftUI

struct NewTodoView: View {
    @State private var title = ""
    @State private var subtitle = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var goAway
    var body: some View {
        Form {
            Section {
                TextField("Title" , text: $title)
                TextField("Subtitle" , text: $subtitle)
            }
            Section{
                Button("Save"){
                    let todo = Todo(title: title, subtitle: subtitle)
                    sourceArray.append(todo)
                    goAway()
                }
                Button("Cancel" , role: .destructive){}
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
