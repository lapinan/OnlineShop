//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit

class CategoryViewController: UIViewController {

    
    //MARK: Views
    private let categoryTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 60
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
        return table
    }()
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
