//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation
import UIKit

class ProductViewModel {
    var idCard: String
    
    var products: [ProductModel.Card] = []
    
    weak var collectionView: UICollectionView?
    
    //MARK: Intent(s)
    func getProductCards() {
        ProductModel().getProducts(idCard: idCard) { cards in
            
            self.products = cards
            
            self.collectionView?.reloadData()
            
        }
    }
    
    init(idCard: String) {
        self.idCard = idCard
    }
}
