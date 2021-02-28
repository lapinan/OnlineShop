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
        
    }
    
    private func setupTabBar() {
        categoryVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_store"), tag: 0)
    
        let allObjcets = realm.objects(RealmlCardsInBasket.self)
        
        basketVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_cart"), tag: 0)
        if allObjcets.count > 0 {
            basketVC.tabBarItem.badgeValue = "\(allObjcets.count)"
        }
        
        setViewControllers([categoryVC, basketVC], animated: true)
    }
}
