//
//  BasketModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import RealmSwift

struct BasketModel {
    let realm = try! Realm()
    let realmMethods = RealmMethods()
    
    func showBasket(completion: @escaping ([BasketCard], Int) -> () ) {
        var cards: [BasketCard] = []
        var fullPrice = 0
        let allCards = realm.objects(RealmlCardsInBasket.self)
        for card in allCards {
            var images = Array<String>()
            for image in card.images {
                images.append(image)
            }
            let basketCard = BasketCard(name: card.name, price: card.price, images: images, descriptino: card.descrip, setSize: card.setSize, color: card.color)
            cards.append(basketCard)
            fullPrice += Int(card.price)!
        }
        DispatchQueue.main.async {
            completion(cards, fullPrice)
        }
    }
    func showNextVC(name: String, description: String, price: String, images: [String], color: String, setSize: String ) -> CardViewController {
        let vc = CardViewController()
        vc.colorString = color
        vc.descriptionString = description
        vc.imagesString = images
        vc.nameString = name
        vc.priceString = price
        vc.setSize = setSize
        return vc
    }
    func deleteAllRealm() {
        realmMethods.deleteAllInRealm()
    }
    
    struct BasketCard {
        let name: String
        let price: String
        let images: [String]
        let descriptino: String
        let setSize: String
        let color: String 
    }
}
