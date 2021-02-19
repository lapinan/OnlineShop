//
//  RealmMethods.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import RealmSwift

class RealmMethods {
    let realm = try! Realm()
    
    func saveInRealm(with object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
    func deleteAllInRealm() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
