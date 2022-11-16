//
//  DetailCell.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    
    let itemPrice: UILabel = {
        let label = UILabel()
        label.text = "price"
        return label
    }()
    
    let itemStock: UILabel = {
        let label = UILabel()
        label.text = "Stock"
        return label
    }()
    
    let itemRating: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        return label
    }()
    
    let itemDescription: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [
            itemDescription, itemPrice, itemStock, itemRating
        ])
        layer.cornerRadius = 20
        stackView.axis = .vertical
        stackView.backgroundColor = .beelineYelow
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
