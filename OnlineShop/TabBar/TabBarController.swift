//
//  TabBarController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit
import RealmSwift

class TabBarController: UITabBarController {
    let realm = try! Realm()
    
    let categoryVC =  UINavigationController(rootViewController: CategoryViewController())
    let basketVC = UINavigationController(rootViewController: BasketViewController())
    
    override func viewDidLoad() {
        setupTabBar()
        
        let allProductsInBasket = realm.objects(RealmlCardsInBasket.self)
        if allProductsInBasket.count > 0 {
            basketVC.tabBarItem.badgeValue = "\(allProductsInBasket.count)"
        }
    }
    
    private func setupTabBar() {
        categoryVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_store"), tag: 0)
        
        basketVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_cart"), tag: 0)
        
        setViewControllers([categoryVC, basketVC], animated: true)
    }
}
