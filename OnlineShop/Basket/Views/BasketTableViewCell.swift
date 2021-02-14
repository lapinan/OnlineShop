//
//  BasketTableViewCell.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class BasketTableViewCell: UITableViewCell {
    
    static let id = "BasketTableViewCell"
    
    //MARK: Views
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private let trashIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "trash_icon"), for: .normal)
        return button
    }()
    let productSizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        return label
    }()
    let productColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        return label
    }()
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    
    //MARK: Constriants
    private func setProductImageViewConstraints() {
        addSubview(productImageView)

        productImageView.snp.makeConstraints { make in
            make.height.equalTo(74.33)
            make.width.equalTo(79)
            make.left.equalToSuperview().inset(7)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setProductNameLabelConstraints() {
        addSubview(productNameLabel)
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalTo(productImageView.snp.right).inset(-10)
            make.right.equalToSuperview().inset(18)
            make.height.equalTo(16)
        }
    }
    
    private func setTrashIconConstraints() {
        addSubview(trashIcon)
        
        trashIcon.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.height.width.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
    private func setProductSizeLabelConstraints() {
        addSubview(productSizeLabel)
        
        productSizeLabel.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).inset(-10)
            make.right.equalTo(trashIcon.snp.left).inset(-56)
            make.top.equalTo(productNameLabel.snp.bottom).inset(-5)
            make.height.equalTo(16)
        }
    }
    private func setProductColorLabelConstraints() {
        addSubview(productColorLabel)
        
        productColorLabel.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).inset(-10)
            make.right.equalTo(trashIcon.snp.left).inset(-56)
            make.top.equalTo(productSizeLabel.snp.bottom).inset(-1)
            make.height.equalTo(16)
        }
    }
    private func setProductPriceConstratins() {
        addSubview(productPriceLabel)
        
        productPriceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(9)
            make.left.equalTo(productImageView.snp.right).inset(-10)
            make.top.equalTo(productColorLabel.snp.bottom).inset(-9)
            make.right.equalToSuperview().inset(10)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTrashIconConstraints()
        setProductImageViewConstraints()
        setProductNameLabelConstraints()
        setProductSizeLabelConstraints()
        setProductColorLabelConstraints()
        setProductPriceConstratins()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
