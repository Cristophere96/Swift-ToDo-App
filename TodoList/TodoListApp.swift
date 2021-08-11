//
//  TodoListApp.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 10/08/21.
//

import SwiftUI

@main
struct TodoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
