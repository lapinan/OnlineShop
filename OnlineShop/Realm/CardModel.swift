//
//  CardModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import RealmSwift
import Realm

struct CardModel {
    
    let realm = try Realm()
    
    
    func saveRealm(objc: Object) {
        try! realm.write {
            realm.add(objc)
        }
    }
    
    
}
