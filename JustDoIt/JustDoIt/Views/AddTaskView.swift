//
//  AddTaskView.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct AddTaskView: View {
    @State private var taskName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("할 일 추가하기")
                .foregroundColor(.white)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                TextField("", text: $taskName, prompt: Text("여기에 해야 할 일을 적어주세요").foregroundColor(.gray))
                    .foregroundColor(.white)
                    .background(Color.black)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.black)
            .cornerRadius(10)
            
            Spacer()
            
            Button {
                print("할 일 추가!")
                dismiss()
            } label: {
                Text("추가하기")
                    .foregroundColor(.white)
                    .font(.headline).bold()
                    .padding()
                    .padding(.horizontal)
                    .background(Color.accentColor)
                    .cornerRadius(50)
            }
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(uiColor: .background))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
