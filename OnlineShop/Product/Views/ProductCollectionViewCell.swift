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
        label.backgroundColor = .black
        return label
    }()
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Constraints
    
}
