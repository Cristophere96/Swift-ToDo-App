//
//  TaskItemView.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 11/08/21.
//

import SwiftUI
import CoreData

struct TaskItemView: View {
    var task: Task
    var homeVM: HomeViewModel
    var context: NSManagedObjectContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(task.content ?? "")
                .font(.headline)
                .foregroundColor(Color("Font"))
                .fontWeight(.semibold)
            
            Text(task.date ?? Date(), style: .date)
                .font(.caption)
                .foregroundColor(Color("Font").opacity(0.8))
        }
        .padding()
        .background(
            Color("Font").opacity(0.1)
                .blur(radius: 1)
        )
        .cornerRadius(10)
        .contextMenu{
            Button(action: {
                homeVM.editItem(item: task)
            }){
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
            
            Button(action: {
                homeVM.deleteItem(item: task, context: context)
            }) {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
            }
        }
    }
}
