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
    
    func showBasket(completion: @escaping ([BasketCard]) -> () ) {
        var cards: [BasketCard] = []
        let allCards = realm.objects(RealmlCardsInBasket.self)
        for card in allCards {
            var images = Array<String>()
            for image in card.images {
                images.append(image)
            }
            let basketCard = BasketCard(name: card.name, price: card.price, images: images, descriptino: card.descrip, setSize: card.setSize, color: card.color)
            cards.append(basketCard)
        }
        DispatchQueue.main.async {
            completion(cards)
        }
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
