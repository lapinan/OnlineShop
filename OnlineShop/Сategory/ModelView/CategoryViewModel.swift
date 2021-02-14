//
//  CategoryViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation

class CategoryViewModel {
    private let model = CategoryGetModel()
        
    //MARK: Intent(s)
    func showNextController() -> SubCategoryViewController {
       return model.showSubCategories()
    }
}
