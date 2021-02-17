//
//  ProductCardJSONModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

struct CardsProductModel: Codable {
    let name: String
    let englishName: String
    let sortOrder: String
    let article: String
    let collection: String?
    let description: String
    let colorName: String
    let colorImageURL: String
    let mainImage: String
    let productImages: [SubProductImages]
    let offers: [SubOffers]
    let recommendedProductIDs: [String]
    let instagramPhotos: [String]?
    let price: String
    let oldPrice: String?
    let tag: String?
    let attributes: [SubAttribures]
}
struct SubProductImages: Codable {
    let imageURL: String
    let sortOrder: String
}
struct SubOffers: Codable {
    let size: String
    let productOfferID: String
    let quantity: String
}
struct SubAttribures: Codable {
    let декоративныйЭлемент: String?
    let рисунок: String?
    let сезон: String?
    let состав: String?
    let странаПроизводителя: String?
    let уходЗаВещами: String?

    enum CodingKeys: String, CodingKey {
        case декоративныйЭлемент = "Декоративный элемент"
        case рисунок = "Рисунок"
        case сезон = "Сезон"
        case состав = "Состав"
        case странаПроизводителя = "Страна производителя"
        case уходЗаВещами = "Уход за вещами"
    }
}
