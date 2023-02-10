//
//  ContentView.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowAddTaskView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
            
            MainAddButton()
                .padding()
                .onTapGesture {
                    isShowAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $isShowAddTaskView) {
            AddTaskView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(uiColor: .background))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
