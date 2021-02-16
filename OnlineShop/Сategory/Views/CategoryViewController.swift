//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit
import SnapKit
import SDWebImage
import ProgressHUD

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

        //setups
        setupSuperView()
        setupNavBar()
        
        //constraints
        setCategoryTableViewConstraints()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ProgressHUD.dismiss()
        if !isShowed {
            viewModel.getCategories()
            isShowed = true
        }
    }
    
    var isShowed = false
    
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
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id) as? CategoryTableViewCell {
            
            cell.backgroundColor = .white
            
            let categories = viewModel.categories[indexPath.row]
            
            cell.nameCategoriesLabel.text = categories.nameString
            if let url = URL(string: categories.imageString) {
                cell.mainImage.sd_setImage(with: url, completed: nil)
                return cell
            }
            if let url = URL(string: "https://blackstarshop.ru/image/catalog/style/modile/acc_cat.png") {
                cell.mainImage.contentMode = .scaleAspectFit
                cell.mainImage.sd_setImage(with: url, completed: nil)
                
                return cell
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

//MARK: Delegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewModel.showNextController(subCategory: viewModel.categories[indexPath.row].subCategories), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
