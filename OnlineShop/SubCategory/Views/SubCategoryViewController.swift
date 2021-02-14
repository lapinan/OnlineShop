//
//  SubCategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class SubCategoryViewController: UIViewController {
    
    //MARK: Views
    private lazy var subCategoryTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.separatorInset = .zero
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //View
        view.backgroundColor = .white
        
        //Constraints
        setSubCategoryTableViewConstraints()
    }
    
    //MARK: Constraints
    private func setSubCategoryTableViewConstraints() {
        view.addSubview(subCategoryTableView)
        
        subCategoryTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

//MARK: DataSource
extension SubCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id) as? CategoryTableViewCell {
            
            cell.mainImage.backgroundColor = .red
            cell.nameCategoriesLabel.text = "SubCategories"
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

//MARK
extension SubCategoryViewController:  UITableViewDelegate {
    
}
