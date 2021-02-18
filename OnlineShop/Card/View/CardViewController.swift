//
//  CardViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 17.02.2021.
//

import UIKit
import SnapKit
import SDWebImage

class CardViewController: UIViewController {

    //MARK: Views
    private let layout = UICollectionViewFlowLayout()
    private lazy var imagesCollectionView: UICollectionView = {
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.backgroundColor = .white
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        colletion.dataSource = self
        colletion.delegate = self
        colletion.isPagingEnabled = true
        colletion.showsHorizontalScrollIndicator = false
        colletion.backgroundColor = .white
        colletion.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: ImagesCollectionViewCell.id)
        return colletion
    }()
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPageIndicatorTintColor = UIColor(red: 0, green: 0.784, blue: 0.325, alpha: 1)
        return page
    }()
    private let nameProductLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    private let lowerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        return view
    }()
    private lazy var priceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private let priceNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.text = "Стоимость:"
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.alpha = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.textAlignment = .right
        return label
    }()
    private let inBasketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ДОБАВИТЬ В КОРЗИНУ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(addInBasket), for: .touchUpInside)
        return button
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    private lazy var colorTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.separatorInset = .zero
        table.isScrollEnabled = false
        table.rowHeight = UIScreen.main.bounds.height * 0.25 / CGFloat(sizesString.count)
        table.register(SizeTableViewCell.self, forCellReuseIdentifier: SizeTableViewCell.id)
        return table
    }()
    private lazy var sizeTableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.rowHeight = UIScreen.main.bounds.height * 0.25 / CGFloat(sizesString.count)
        table.dataSource = self
        table.separatorInset = .zero
        table.isScrollEnabled = false
        table.register(SizeTableViewCell.self, forCellReuseIdentifier: SizeTableViewCell.id)
        table.backgroundColor = .white
        return table
    }()
    private lazy var sizeView: UIView = {
        let view = UIView()
        view.addSubview(sizeTableView)
        view.addSubview(colorTableView)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imagesString: [String] = []
    var priceString: String = ""
    var descriptionString: String = ""
    var nameString: String = ""
    var sizesString: [String] = []
    var colorString: String = ""
    var setSize = ""
    
    var isShowSizeView = false
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavBar()
        setAllText()
        setImagesCollectionViewConstraints()
        setNameProductLabelConstraints()
        setLowerViewConstraints()
        setPriceViewConstraints()
        setInBasketButtonConstraints()
        setDescriptionLabelConstratins()
        setPageControlConsstraints()
        setSizeViewConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideSizeView()
    }
    
    
    
    
    
    
    private func setAllText() {
        nameProductLabel.text = nameString
        descriptionLabel.text = descriptionString
        priceLabel.text = priceString
    }
    private func setupNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    private func hideSizeView() {
        if isShowSizeView {
            UIView.animate(withDuration: 0.2) {
                self.sizeView.snp.updateConstraints { make in
                    make.left.right.equalToSuperview()
                    make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                    make.height.equalTo(0)
                }
                self.view.layoutIfNeeded()
            }
            isShowSizeView = !isShowSizeView
        }
    }
    private func showSubView() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.sizeView.snp.updateConstraints { make in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                make.height.equalTo(self.view.frame.height * 0.25)
            }
            self.colorTableView.snp.makeConstraints { make in
                make.left.bottom.top.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
            }
            self.view.layoutIfNeeded()
            self.sizeTableView.snp.makeConstraints { make in
                make.right.top.bottom.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
            }
        }, completion: nil)
    }
    
    //MARK: Actions
    @objc
    private func addInBasket() {
        if !isShowSizeView {
            showSubView()
            isShowSizeView = !isShowSizeView
        }
    }
    
    //MARK: Constraints
    private func setPageControlConsstraints() {
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(20)
            make.height.equalTo(10)
            make.bottom.equalTo(imagesCollectionView.snp.bottom).inset(10)
        }
    }
    
    private func setImagesCollectionViewConstraints() {
        view.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY)
        }
    }
    private func setNameProductLabelConstraints() {
        view.addSubview(nameProductLabel)
        nameProductLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(imagesCollectionView.snp.bottom).inset(-9)
        }
    }
    private func setLowerViewConstraints() {
        view.addSubview(lowerView)
        lowerView.snp.makeConstraints { make in
            make.centerX.equalTo(nameProductLabel.snp.centerX)
            make.left.equalTo(nameProductLabel.snp.left)
            make.height.equalTo(1)
            make.top.equalTo(nameProductLabel.snp.bottom)
        }
    }
    private func setPriceViewConstraints() {
        
        //MainView
        view.addSubview(priceView)
        priceView.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(lowerView.snp.bottom)
        }
        
        //PriceNameLabel
        priceView.addSubview(priceNameLabel)
        priceNameLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(priceView.snp.centerX)
        }
        
        //PriceLabel
        priceView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(priceView.snp.centerX)
        }
    }
    private func setInBasketButtonConstraints() {
        view.addSubview(inBasketButton)
        inBasketButton.snp.makeConstraints { make in
            make.top.equalTo(priceView.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        inBasketButton.layer.cornerRadius = 10
    }
    private func setDescriptionLabelConstratins() {
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(inBasketButton.snp.bottom).inset(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
    private func setSizeViewConstraints() {
        view.addSubview(sizeView)
        sizeView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

//MARK: DataSource
extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imagesString.count
        
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.id, for: indexPath) as? ImagesCollectionViewCell {
            
            if let url = URL(string: "https://blackstarshop.ru/\(imagesString[indexPath.row])") {
                cell.image.sd_setImage(with: url, completed: nil)
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
}
extension CardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sizeTableView {
            return sizesString.count
        }
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SizeTableViewCell.id) as? SizeTableViewCell {
            
            if tableView == colorTableView {
                cell.nameLabel.text = colorString
                cell.setImageView.image = UIImage(named: "accept_icon")
            }
            if tableView == sizeTableView {
                cell.nameLabel.text = sizesString[indexPath.row]
                if setSize == sizesString[indexPath.row] {
                    cell.setImageView.image = UIImage(named: "accept_icon")
                }
            }
            
            cell.backgroundColor = .white
            
            return cell
        }
        
        return UITableViewCell()
    }
}

//MARK: FlowLayout
extension CardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imagesCollectionView.frame.width, height: imagesCollectionView.frame.height)
    }
}

//MARK: Delegate
extension CardViewController: UITableViewDelegate {

}

extension CardViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }


}
