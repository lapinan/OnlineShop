//
//  ProductViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit
import ProgressHUD

class ProductViewController: UIViewController {
    
    lazy var viewModel = ProductViewModel(idCard: idCard)
    
    //MARK: Views
    private let layout = UICollectionViewFlowLayout()
    private lazy var productCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        layout.scrollDirection = .vertical
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.id)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        collection.backgroundColor = .white
        return collection
    }()
    
    var idCard = ""
    var isShowed = false
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setProductCollectionViewConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.collectionView = productCollectionView
        if !isShowed {
            viewModel.getProductCards()
            isShowed = true
        }
    }
    
    //MARK: Constraints
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setProductCollectionViewConstraints() {
        
        
        view.addSubview(productCollectionView)
        
        productCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

//MARK: DataSource
extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath) as? ProductCollectionViewCell {
            
            cell.backgroundColor = .white
    
            cell.productDescriptionLabel.text = viewModel.products[indexPath.row].descriptionString
            cell.productPriceLabel.text = "\(viewModel.products[indexPath.row].priceString)руб."
            if let url = URL(string: "https://blackstarshop.ru/\(viewModel.products[indexPath.row].mainImageString)") {
                cell.productMainImage.sd_setImage(with: url, completed: nil)

                return cell
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//MARK: FlowLayout
extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productCollectionView.frame.width / 2 - 20, height: 210)
    }
}


//MARK: Delgate
extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.products[indexPath.row])
        navigationController?.pushViewController(viewModel.showNextVC(card: viewModel.products[indexPath.row]), animated: true)
    }
}
