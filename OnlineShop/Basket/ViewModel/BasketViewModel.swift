//
//  BasketViewModel.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 19.02.2021.
//

import Foundation
import ProgressHUD

class BaskeViewModel {
    private let model = BasketModel()
    
    var cards: [BasketModel.BasketCard] = []
    var fullPrice = 0
    
    weak var tableView: UITableView?
    weak var priceLabel: UILabel? 
    
    //MARK: Intent(s)
    func showBasket() {
        model.showBasket { cardsBasket, fullPrice in
            self.cards = cardsBasket
            self.fullPrice = fullPrice
            self.priceLabel?.text = "\(fullPrice)руб."
            self.tableView?.reloadData()
        }
    }
    func showNextVC(name: String, description: String, price: String, images: [String], color: String, setSize: String) -> CardViewController {
        return model.showNextVC(name: name, description: description, price: price, images: images, color: color, setSize: setSize)
    }
}
