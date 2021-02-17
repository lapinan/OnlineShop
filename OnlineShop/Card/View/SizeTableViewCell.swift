//
//  SizeTableViewCell.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 17.02.2021.
//

import UIKit
import SnapKit

class SizeTableViewCell: UITableViewCell {
    
    static let id = "SizeTableViewCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    let setImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageViewConstraints()
        setNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setImageViewConstraints() {
        addSubview(setImageView)
        setImageView.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    private func setNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(16)
            make.right.equalTo(setImageView.snp.left)
        }
    }
}
