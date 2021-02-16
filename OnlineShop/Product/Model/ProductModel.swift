//
//  ProductModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

struct ProductModel {
    
    func getProducts(idCard: String, completion: @escaping ([Card]) -> () ) {
        typealias cardModel = [String: CardModel]
        
        var cards: [Card] = []
        
        let urlString = "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(idCard)"
        guard let url = URL(string: urlString) else {
            print("url is nil, please check url: \(urlString)")
            return
        }
        let request = URLRequest(url: url)
        let _ = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                print("data is nil")
                return
            }
            do {
                let json = try JSONDecoder().decode(cardModel.self, from: data)
                
                var imagesString: [String] = []
                var sizesString: [String] = []
                
                for card in json {
                    imagesString.append(card.value.mainImage)
                    
                    for image in card.value.images {
                        imagesString.append(image)
                    }
                    for size in card.value.sizes {
                        sizesString.append(size)
                    }
                    
                    if !card.value.name.isEmpty,
                       !card.value.description.isEmpty,
                       !card.value.price.isEmpty,
                       !card.value.sizes.isEmpty,
                       !card.value.colorName.isEmpty {
                        
                        let card = Card(mainImageString: card.value.mainImage, imagesString: imagesString, priceString: card.value.price, descriptionString: card.value.description, sizesString: sizesString, colorNameString: card.value.colorName)
                        
                        cards.append(card)
                        
                    }
                }
                DispatchQueue.main.async {
                    completion(cards)
                }
            }catch let error {
                print(error)
            }
        }.resume()
    }
    
    struct Card {
        let mainImageString: String
        let imagesString: [String]
        let priceString: String
        let descriptionString: String
        let sizesString: [String]
        let colorNameString: String
    }
}
