//
//  MainAddButton.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import SwiftUI

struct MainAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color.accentColor)
            Image(systemName: "plus")
                .resizable()
                .foregroundColor(.white)
                .scaledToFit()
                .frame(width: 24)
        }
        .frame(height: 50)
    }
}

struct MainAddButton_Previews: PreviewProvider {
    static var previews: some View {
        MainAddButton()
    }
}
