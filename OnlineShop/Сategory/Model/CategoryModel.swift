//
//  CategoryModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation

struct CategoryValue: Codable {
    let name: String
    let sortOrder: SortOrder
    let image, iconImage, iconImageActive: String
    let subcategories: [Subcategory]
}

enum SortOrder: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(SortOrder.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SortOrder"))
    }
    
    func getString() -> String {
        switch self {
        case .integer(let num):
            return String(num)
        case .string(let num):
            return String(num)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let id: SortOrder
    let iconImage: String
    let sortOrder: SortOrder
    let name: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case category = "Category"
    case collection = "Collection"
}
