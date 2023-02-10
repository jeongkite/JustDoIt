//
//  TaskRow.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct TaskRow: View {
    var taskTitle: String
    var isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(.white)
            
            Text(taskTitle)
                .foregroundColor(.white)
        }
        .background(Color(uiColor: .background))
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(taskTitle: "일기쓰기", isCompleted: true)
    }
}
