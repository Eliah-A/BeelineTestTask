//
//  AboutViewController.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    private let beeImageView: UIImageView = {
        let beeImage = UIImage(named: "happy bee.png")
        let imageView:UIImageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.frame.size.width = 200
        imageView.frame.size.height = 200
        imageView.image = beeImage
        return imageView
    }()
    
    private let aboutTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.text =
        """
        Hi! I'm glad you are here! My name is Ilya,
        and I want to introduce you to this test application for Beeline!
        The app contains two screens based on UICollectionViews.
        UI is created completely programmatically.
        The implementation pursues best practices and MVC architecture.
        
        I hope you enjoy it!
        my contact : andrusyak1s@yandex.ru
        """
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        beeImageView.center = self.view.center
        aboutTextLabel.center = CGPoint(x: self.view.center.x,
                                        y: self.view.center.y + 180)
        view.addSubview(beeImageView)
        view.addSubview(aboutTextLabel)
    }
}
    
