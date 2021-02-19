//
//  CardRealmModel .swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import RealmSwift

class CardRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    @objc dynamic var size = ""
    @objc dynamic var image = ""
    @objc dynamic var color = ""
}
