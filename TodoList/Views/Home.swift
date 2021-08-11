//
//  Home.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 10/08/21.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeVM = HomeViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                HomeHeaderView()
                
                if results.isEmpty {
                    Spacer()
                    Text("You haven't created tasks")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            ForEach(results) { task in
                                TaskItemView(task: task, homeVM: homeVM, context: context)
                            }
                        }
                        .padding()
                    }
                }
            }
            
            Button(action: {
                homeVM.isNewData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: Gradient(colors: [Color("Brand1"), .purple, Color("Brand1")]),
                                        center: .center)
                    )
                    .clipShape(Circle())
            })
            .padding()
        })
        .sheet(isPresented: $homeVM.isNewData, content: {
            NewDataView(homeData: homeVM)
        })
    }
}
