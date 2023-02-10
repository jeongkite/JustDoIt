//
//  Task.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import Foundation

import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false
}
