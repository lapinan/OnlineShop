//
//  CategoryGetModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import Foundation

struct CategoryGetModel {
    
    mutating func getCategories(completion: @escaping ([Category]) -> () ) {
        
        typealias categoriesTypealias = [String: CategoryValue]
        
        var getCategories: [Category] = []
        var subCaregories: [Subcategory] = []
        
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
                            
                            for subCat in main.value.subcategories {
                                if subCat.type == TypeEnum.category,
                                   !subCat.name.isEmpty {
                                    subCaregories.append(Subcategory(id: subCat.id, iconImage: subCat.iconImage, sortOrder: subCat.sortOrder, name: subCat.name, type: subCat.type))
                                }
                            }
                            
                            let category = Category(nameString: main.value.name, imageString: "https://blackstarshop.ru/\(main.value.image)", subCategories: subCaregories)
                            getCategories.append(category)
                            
                        }
                    }
                    DispatchQueue.main.async {
                        completion(getCategories)
                    }
                } catch let error {
                    print(error)
                }
                
            }.resume()

        } else {
            print("URL IS NIL")
        }
    }
    
    func showSubCategories(subCategory: [Subcategory]) -> SubCategoryViewController {
        let vc = SubCategoryViewController()
        vc.subCategories = subCategory
        return vc
    }
    
    struct Category {
        let nameString: String
        let imageString: String
        let subCategories: [Subcategory]
    }
    
}
