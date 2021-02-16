//
//  SubCategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit
import SDWebImage
import ProgressHUD

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
    
    var subCategories: [Subcategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //View
        view.backgroundColor = .white
        
        //Constraints
        setSubCategoryTableViewConstraints()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        return subCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id) as? CategoryTableViewCell {
            
            cell.nameCategoriesLabel.text = subCategories[indexPath.row].name
            if subCategories[indexPath.row].iconImage == "" {
                cell.mainImage.sd_setImage(with: URL(string: "https://blackstarshop.ru/image/catalog/style/modile/acc_cat.png"), completed: nil)
                
                return cell
            }
            guard let url = URL(string: "https://blackstarshop.ru/\(subCategories[indexPath.row].iconImage)") else {
                return cell
            }
            cell.mainImage.sd_setImage(with: url, completed: nil)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

//MARK
extension SubCategoryViewController:  UITableViewDelegate { }
