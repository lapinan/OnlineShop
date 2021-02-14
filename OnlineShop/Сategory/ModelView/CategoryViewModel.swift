//
//  CategoryViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation
import UIKit

class CategoryViewModel {
    private var model = CategoryGetModel()
    
    
    weak var categoryTableView: UITableView?

    var categories: [CategoryGetModel.Category] { return model.categories }
    
    func updateCategories() {
        model.getCategories {
            
            print(self.model.categories)
            
            self.categoryTableView?.reloadData()
        }
    }
    
    //MARK: Intent(s)
    func showNextController() -> SubCategoryViewController {
       return model.showSubCategories()
    }
}
