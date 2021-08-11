//
//  NewDataView.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 10/08/21.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("\(homeData.updateItem == nil ? "Add new" : "Update") Task")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Font"))
                Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $homeData.content)
                .cornerRadius(10)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Font"))
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 10) {
                DateButton(title: "Today", homeData: homeData)
                DateButton(title: "Tomorrow", homeData: homeData)
                
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            Button(action: {
                homeData.writeData(context: context)
            }, label: {
                Text(homeData.updateItem == nil ? "Add task" : "Update task")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("Brand1"), .purple]),
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(8)
            })
            .padding()
            .disabled(homeData.content == "")
            .opacity(homeData.content == "" ? 0.5 : 1)
        }
        .background(Color("Font").opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}
