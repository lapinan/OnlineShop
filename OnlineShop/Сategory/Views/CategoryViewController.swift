//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    var viewModel = CategoryViewModel()

    
    //MARK: Views
    private lazy var categoryTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 80
        table.backgroundColor = .white
        table.dataSource = self
        table.delegate = self
        table.separatorInset = .zero
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
        return table
    }()
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.categoryTableView = categoryTableView
        
        viewModel.updateCategories()
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


//MARK: DataSource
extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id) as? CategoryTableViewCell {
            
            cell.mainImage.backgroundColor = .red
            cell.nameCategoriesLabel.text = "Categories"
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

//MARK: Delegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewModel.showNextController(), animated: true)
    }
}
