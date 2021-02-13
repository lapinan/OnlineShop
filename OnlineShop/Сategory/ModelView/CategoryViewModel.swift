//
//  CategoryViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation

class CategoryViewModel {
    let model = CategoryGetModel()
    
    var categories: [CategoryGetModel.Category] { model.categories }
    
    //MARK: Intent(s)
}
