//
//  TasksView.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var isShowAddTaskView: Bool = false
    
    var body: some View {
        VStack {
            Text("Just Do It!")
                .font(.title).bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                if realmManager.tasks.isEmpty {
                    VStack {
                        Spacer()
                        Text("앗, 아직 할 일이 없어요!")
                            .bold()
                        Spacer()
                        Text("버튼을 눌러 새로운 할 일을 추가해보세요")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .listRowSeparator(.hidden)
                        Spacer()
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                    ForEach(realmManager.tasks, id: \.id) { task in
                        if !task.isInvalidated {
                            TaskRow(taskTitle: task.taskTitle, isCompleted: task.isCompleted)
                                .onTapGesture {
                                    realmManager.updateStateOfTask(id: task.id, isCompleted: !task.isCompleted)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    } label: {
                                        Label("삭제", systemImage: "trash")
                                    }
                                    Button() {
                                        isShowAddTaskView.toggle()
                                    } label: {
                                        Label("수정", systemImage: "pencil")
                                    }
                                }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.top, -35)
        }
        .sheet(isPresented: $isShowAddTaskView) {
            AddTaskView(viewType: .edit)
                .environmentObject(realmManager)
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
