//
//  DateButton.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 10/08/21.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        Button(action: {
            homeData.updateDate(value: title)
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    homeData.checkDate() == title ?
                        LinearGradient(gradient: Gradient(colors: [Color("Brand1"), .purple]),
                                       startPoint: .leading, endPoint: .trailing)
                        : LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}
