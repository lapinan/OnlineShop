//
//  ProductCollectionViewCell.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let id = "ProductCollectionViewCell"
    
    
    //MARK: Views
    let productMainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.backgroundColor = .white
        return label
    }()
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProductMainImageConstraints()
        setProductPriceLabelConstraints()
        setProductDescriptionLabelConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Constraints
    private func setProductMainImageConstraints() {
        addSubview(productMainImage)
        
        productMainImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(168)
        }
    }
    private func setProductPriceLabelConstraints() {
        addSubview(productPriceLabel)
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productMainImage.snp.bottom).inset(-5)
            make.right.left.equalToSuperview().inset(5)
            make.height.equalTo(16)
        }
    }
    private func setProductDescriptionLabelConstraints() {
        addSubview(productDescriptionLabel)
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.left.right.equalToSuperview().inset(5)
            make.top.equalTo(productPriceLabel.snp.bottom).inset(-5)
        }
    }
    
}
