//
//  CategoryViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation
import UIKit
import ProgressHUD

class CategoryViewModel {
    private var model = CategoryGetModel()
    
    
    weak var categoryTableView: UITableView?

    var categories: [CategoryGetModel.Category] = []
    
    func getCategories() {
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show()
        model.getCategories { cat in
            
            self.categories = cat
            
            self.categoryTableView?.reloadData()
            ProgressHUD.dismiss()
        }
    }
    
    //MARK: Intent(s)
    func showNextController() -> SubCategoryViewController {
       return model.showSubCategories()
    }
}
