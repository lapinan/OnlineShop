//
//  BasketViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController {
    let viewModel = BaskeViewModel()
    
    //MARK: View
    private lazy var productTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.separatorInset = .zero
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.id)
        table.rowHeight = 96
        return table
    }()
    private let buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        button.setTitle("Оформить заказ", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 1)
        return button
    }()
    private let fullPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let nameTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.text = "Итого:"
        return label
    }()
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.alpha = 0.4
        label.textAlignment = .right
        return label
    }()
    private let lowerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        return view
    }()
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        //View
        view.backgroundColor = .white
        
        //Constraints
        setupNavBar()
        setBuyButtonConstraints()
        setFullPriceViewConstraints()
        setProductTableViewConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.tableView = productTableView
        viewModel.priceLabel = totalPriceLabel
        viewModel.showBasket()
    }
    

    
    //MARK: Actions
    @objc
    private func deleteAllInBasket() {
        viewModel.deleteAllInBasket()
    }
    @objc
    private func deleteProduct(_ sender: UIButton) {
        print("tapped me basket")
    }

    //MARK: Constraints
    private func setupNavBar() {
        navigationItem.title = "Корзина"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Очитсить", style: .done, target: self, action: #selector(deleteAllInBasket))
    }
    private func setBuyButtonConstraints() {
        view.addSubview(buyButton)
        
        //Constraints
        buyButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
        }
        
        //
        buyButton.layer.cornerRadius = 24
    }
    private func setProductTableViewConstraints() {
        view.addSubview(productTableView)
        
        productTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(fullPriceView.snp.top)
        }
    }
    private func setFullPriceViewConstraints() {
        view.addSubview(fullPriceView)
        
        
        //constraints mainView
        fullPriceView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(64)
            make.bottom.equalTo(buyButton.snp.top).inset(-20)
        }
        
        //constraints nameTotalPriceLabel
        fullPriceView.addSubview(nameTotalPriceLabel)
        nameTotalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(fullPriceView.snp.left).inset(16)
            make.height.equalTo(16)
            make.centerY.equalTo(fullPriceView.snp.centerY)
            make.right.equalTo(fullPriceView.snp.centerX)
        }
        
        //constraints totalPriceLabel
        fullPriceView.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { make in
            make.right.equalTo(fullPriceView.snp.right).inset(16)
            make.centerY.equalTo(fullPriceView.snp.centerY)
            make.height.equalTo(16)
            make.left.equalTo(fullPriceView.snp.centerX)
        }
        
        //constraints lowerView
        fullPriceView.addSubview(lowerView)
        lowerView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.width.equalTo(fullPriceView.snp.width)
            make.bottom.equalTo(fullPriceView.snp.bottom)
        }
    }
}

//MARK: DataSource
extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.id) as? BasketTableViewCell {
            
            let card = viewModel.cards[indexPath.row]
            
            cell.productColorLabel.text = "Цвет: \(card.color)"
            cell.productNameLabel.text = card.name
            cell.productPriceLabel.text = "Цена: \(card.price)руб."
            cell.productSizeLabel.text = "Размер: \(card.setSize)"
            cell.productImageView.sd_setImage(with: URL(string: "https://blackstarshop.ru/\(card.images[0])"), completed: nil)
                        
            cell.trashIcon.addTarget(self, action: #selector(deleteProduct(_ : )), for: .touchUpInside)
            
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: Delegate
extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let card = viewModel.cards[indexPath.row]
        navigationController?.pushViewController(viewModel.showNextVC(name: card.name, description: card.descriptino, price: card.price, images: card.images, color: card.color, setSize: card.setSize), animated: true)
    }
}
