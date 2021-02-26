//
//  SubCategoryModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

struct SubCategoriesModel {
    func showProductCards(idCard: String, title: String) -> ProductViewController {
        let vc = ProductViewController()
        vc.idCard = idCard
        vc.nameTitleString = title
        return vc
    }
}
