//
//  ProductViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {

    //MARK: Views
    private let layout = UICollectionViewLayout()
    private lazy var productCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        
        collection.backgroundColor = .white
        return collection
    }()
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        setProductCollectionViewConstraints()
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}


//MARK: Delgate
extension ProductViewController: UICollectionViewDelegate { }
