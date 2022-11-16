//
//  DetailViewController.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import Foundation
import UIKit


class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var pickedProduct: ProductModel
    private let detailCellId = "detailCellId"
    private let photoScrollCellId = "photoScrollCellId"
    
    init(product: ProductModel) {
        self.pickedProduct = product
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .beelineYelowOpacity
        self.view.backgroundColor = .beelineBack
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PhotoScrollCell.self, forCellWithReuseIdentifier: photoScrollCellId)
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: detailCellId)
    }
    
    // MARK: - UICollectionViewDelegate Methods
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoScrollCellId,
                                                          for: indexPath) as! PhotoScrollCell
            cell.images = pickedProduct.images         
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId,
                                                          for: indexPath) as! DetailCell
            cell.itemPrice.text = "PRICE: \(round((1 - 0.01*pickedProduct.discountPercentage)*pickedProduct.price))"
            cell.itemStock.text = "STOCK: \(pickedProduct.stock)"
            cell.itemRating.text = "RATING: \(pickedProduct.rating)"
            cell.itemDescription.text = "\(pickedProduct.description)"
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height = CGFloat()
        if indexPath.item == 0 {
            height = 200
        } else {
            height = 200
        }
        return CGSize.init(width: view.frame.width, height: height)
    }
}
