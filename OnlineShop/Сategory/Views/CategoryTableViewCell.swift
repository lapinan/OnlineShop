//
//  CategoryTableViewCell.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 13.02.2021.
//

import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {

    static let id = "CategoryTableViewCell"
    
    //MARK: Views
    let mainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    let nameCategoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    private func setupMainImage() {
        addSubview(mainImage)
        
        //Constraints
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(54)
            make.left.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        //
        mainImage.layer.cornerRadius = 27
    }
    private func setNameCategoriesLabelConstraints() {
        addSubview(nameCategoriesLabel)
        
        nameCategoriesLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.right.equalToSuperview().inset(55)
            make.left.equalTo(mainImage.snp_rightMargin).inset(-16)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainImage()
        setNameCategoriesLabelConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
