//
//  Todo.swift
//  ToDoApp
//
//  Created by Mohmed Ahmed on 10/08/2023.
//

import Foundation
struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
