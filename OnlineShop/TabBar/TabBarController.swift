//
//  TabBarController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    let categoryVC =  UINavigationController(rootViewController: CategoryViewController())
    
    override func viewDidLoad() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        categoryVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon_store"), tag: 0)
        
        setViewControllers([categoryVC], animated: true)
    }
}
