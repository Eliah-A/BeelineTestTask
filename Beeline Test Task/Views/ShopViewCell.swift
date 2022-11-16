//
//  CollectionViewCell.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class ShopViewCell: UICollectionViewCell {
    
    var cellData: ProductModel! {
        didSet {
            let price = round(cellData.price)
            let thumbnailImageUrl = cellData.thumbnail
            let discountPrice = round((1 - 0.01*cellData.discountPercentage)*cellData.price)
            itemTitleLabel.text = cellData.title
            imageView.setImageFromUrl(urlString: thumbnailImageUrl)
            
            if cellData.discountPercentage != 0 {
                itemDiscountLabel.text = "NEW price: \(discountPrice)"
                itemPriceLabel.attributedText = "price: \(price)".strikethrough()
            } else {
                itemDiscountLabel.text = ""
                itemPriceLabel.text = "price: \(price)"
            }
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        
        return imageView
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "price"
        return label
    }()
    
    private let itemDiscountLabel: UILabel = {
        let label = UILabel()
        label.text = "new price"
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.tintColor = .beelineBack
        button.backgroundColor = .beelineYelow
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        
        return button
    }()
    
    private func setStackSubview() {
        let stackView = UIStackView(arrangedSubviews: [
            imageView, itemTitleLabel, itemPriceLabel, itemDiscountLabel, detailButton
        ])
        
        addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .beelineYelowOpacity
        layer.cornerRadius = 15
        clipsToBounds = true
        setStackSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

