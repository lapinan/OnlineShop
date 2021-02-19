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
    
    weak var tableView: UITableView?
    
    //MARK: Intent(s)
    func showBasket() {
        model.showBasket { cardsBasket in
            self.cards = cardsBasket
            self.tableView?.reloadData()
        }
    }
}
