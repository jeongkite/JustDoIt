//
//  TasksView.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("Just Do It!")
                .font(.title).bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    TaskRow(taskTitle: task.taskTitle, isCompleted: task.isCompleted)
                        .onTapGesture {
                            realmManager.updateStateOfTask(id: task.id, isCompleted: !task.isCompleted)
                        }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .background))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
