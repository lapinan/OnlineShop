//
//  CardViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import ProgressHUD

class CardViewModel {
    private let realmMethods = RealmMethods()
    
    //MARK: Intent(s)
    func saveInRealm(name: String, price: String, images: [String], setSize: String, color: String, descritptino: String) {
        let card = RealmlCardsInBasket()
        card.name = name
        card.color = color
        card.price = price
        card.setSize = setSize
        card.descrip = descritptino
        for image in images {
            card.images.append(image)
        }
        DispatchQueue.main.async {
            self.realmMethods.saveInRealm(with: card)
            ProgressHUD.show(icon: AlertIcon.like)
            NotificationCenter.default.post(name: .updateBadgeValue, object: nil)
        }
    }
}
