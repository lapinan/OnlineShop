//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 16.02.2021.
//

import Foundation
import UIKit
import ProgressHUD

class ProductViewModel {
    private let model = ProductModel()
    
    var idCard: String
    
    var products: [ProductModel.Card] = []
    
    weak var collectionView: UICollectionView?
    
    //MARK: Intent(s)
    func getProductCards() {
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show()
        model.getProducts(idCard: idCard) { cards in
            
            self.products = cards
            self.collectionView?.reloadData()
            ProgressHUD.dismiss()
        }
    }
    
    init(idCard: String) {
        self.idCard = idCard
    }
}
