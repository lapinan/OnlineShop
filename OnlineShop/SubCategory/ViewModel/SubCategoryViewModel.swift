//
//  SubCategoryViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation

class SubCategoryViewModel {
    private let model = SubCategoriesModel()
    
    //MARK: Intent(s)
    func showNextVC(idCard: String) -> ProductViewController {
        return model.showProductCards(idCard: idCard)
    }
}
