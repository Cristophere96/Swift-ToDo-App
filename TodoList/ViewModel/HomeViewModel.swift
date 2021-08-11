//
//  HomeViewModel.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 10/08/21.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    @Published var isNewData = false
    @Published var updateItem: Task!
    
    let calendar = Calendar.current
    
    func checkDate() -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other Day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" { date = Date() }
        else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // do something
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        withAnimation {
            if updateItem != nil {
                updateItem.date = date
                updateItem.content = content
                
                try! context.save()
                
                updateItem = nil
                content = ""
                date = Date()
                isNewData.toggle()
            } else {
                let newTask = Task(context: context)
                newTask.date = date
                newTask.content = content
                
                do {
                    try context.save()
                    content = ""
                    date = Date()
                    isNewData.toggle()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func editItem(item: Task) {
        updateItem = item
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
    
    func deleteItem(item: Task, context: NSManagedObjectContext){
        withAnimation {
            context.delete(item)
            try! context.save()
        }
    }
}
