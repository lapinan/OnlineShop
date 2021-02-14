//
//  CategoryGetModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation

struct CategoryGetModel {
    
    var categories: [Category] = []
    
    mutating func getCategories(completion: @escaping () -> () ) {
        
        typealias categoriesTypealias = [String: CategoryValue]
        
        var getCategories: [Category] = []
        
        let urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let _ = URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data = data else {
                    print("data is nil")
                    return
                }
                do {
                    
                    let json = try JSONDecoder().decode(categoriesTypealias.self, from: data)
                    for main in json {
                        if !main.value.image.isEmpty,
                           !main.value.name.isEmpty,
                           !main.value.subcategories.isEmpty {
                            
                            let category = Category(nameString: main.value.name, imageString: main.value.image, subCategories: main.value.subcategories)
                            getCategories.append(category)
                            
                        }
                    }
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch let error {
                    print(error)
                }
                
            }.resume()
            categories = getCategories
        } else {
            print("URL IS NIL")
        }
    }
    
    func showSubCategories() -> SubCategoryViewController {
        let vc = SubCategoryViewController()        
        return vc
    }
    
    struct Category {
        let nameString: String
        let imageString: String
        let subCategories: [Subcategory]
    }
    
}
