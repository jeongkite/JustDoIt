//
//  TasksView.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            Text("Just Do It!")
                .font(.title).bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .background))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}