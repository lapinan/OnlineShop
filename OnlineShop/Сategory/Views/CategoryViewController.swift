//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    let viewModel = CategoryViewModel()

    
    //MARK: Views
    private let categoryTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 60
        table.backgroundColor = .white
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
        return table
    }()
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.categories)
        
        //setups
        setupSuperView()
        setupNavBar()
        
        //constraints
        setCategoryTableViewConstraints()
        
    }
    
    //MARK: Setups
    private func setupSuperView() {
        view.backgroundColor = .white
    }
    private func setupNavBar() {
        navigationItem.title = "Категории"
    }
    
    //MARK: Constraitns
    private func setCategoryTableViewConstraints() {
        view.addSubview(categoryTableView)
        
        categoryTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
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
