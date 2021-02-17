//
//  ProductModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

struct ProductModel {
    
    func getProducts(idCard: String, completion: @escaping ([Card]) -> () ) {
        typealias cardModel = [String: CardsProductModel]
        
        var cards: [Card] = []
        var images: [String] = []
        var sizes: [String] = []
        
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
                for card in json {
                    if !card.value.name.isEmpty,
                       !card.value.description.isEmpty,
                       !card.value.mainImage.isEmpty {
                        images.append(card.value.mainImage)
                        for image in card.value.productImages {
                            images.append(image.imageURL)
                        }
                        for size in card.value.offers {
                            sizes.append(size.size)
                        }
                        let card = Card(mainImageString: card.value.mainImage, imagesString: images, priceString: String(card.value.price.dropLast(5)), descriptionString: card.value.description, sizesString: sizes, colorNameString: card.value.colorName)
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
