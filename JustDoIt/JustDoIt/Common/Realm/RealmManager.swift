//
//  RealmManager.swift
//  JustDoIt
//
//  Created by 양정연 on 2023/02/10.
//

import Foundation

import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    
    init() {
        openRealm()
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
}
