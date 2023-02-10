//
//  RealmManager.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import Foundation
import Combine

import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error - Opening Realm : \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["taskTitle": taskTitle, "isCompleted": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Succeed - Add New Task : \(newTask)")
                }
            } catch {
                print("Error - Add New Task : \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "isCompleted")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
}
