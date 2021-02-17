//
//  SubCategoryModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

struct SubCategoriesModel {
    func showProductCards(idCard: String) -> ProductViewController {
        let vc = ProductViewController()
        vc.idCard = idCard
        return vc
    }
}
