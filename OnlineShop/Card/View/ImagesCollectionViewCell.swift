//
//  ImagesCollectionViewCell.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 17.02.2021.
//

import UIKit
import SnapKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    static let id = "ImagesCollectionViewCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageConstraints() {
        addSubview(image)
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
