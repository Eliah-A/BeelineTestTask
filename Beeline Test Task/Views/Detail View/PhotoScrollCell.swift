//
//  PhotoScrollCell.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class PhotoScrollCell: UICollectionViewCell {
    
    private var photoScroll = UIScrollView()
    
    var images: [String] = []   {
        didSet {
            
            for i in 0...images.count-1 {
                setImage(i)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        photoScroll = UIScrollView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: frame.width,
                                                 height: frame.height))
        photoScroll.contentSize = CGSize(width: UIScreen.main.bounds.width*3,
                                         height: photoScroll.contentSize.height)
        backgroundColor = .beelineYelowOpacity
        layer.cornerRadius = 15
        clipsToBounds = true
        addSubview(photoScroll)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setImage (_ i: Int) {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.setImageFromUrl(urlString: images[i])
        image.frame = CGRect(x: 300*CGFloat(i), y:  0, width: 300, height: 200)
        photoScroll.addSubview(image)
    }
}
