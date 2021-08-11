//
//  HomeHeaderView.swift
//  TodoList
//
//  Created by Cristopher Escorcia on 11/08/21.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Text("Tasks")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("Font"))
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
