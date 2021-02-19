//
//  RalmModels.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import RealmSwift

class RealmlCardsInBasket: Object {
    @objc dynamic var name = ""
    @objc dynamic var setSize = ""
    @objc dynamic var color = ""
    @objc dynamic var price = ""
    dynamic var images = List<String>()
}
