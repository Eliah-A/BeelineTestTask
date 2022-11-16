//
//  TabBarController.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUpTabBar()
        setUpVC()
    }
    
    private func setUpVC() {
        viewControllers = [
            createNavigationController(rootVC: ShopViewController(collectionViewLayout: UICollectionViewFlowLayout()),
                                       title: "SHOP",
                                       image: UIImage(systemName: "cart")!),
            createNavigationController(rootVC: AboutViewController(),
                                       title: "ABOUT",
                                       image: UIImage(systemName: "questionmark")!)
        ]
    }
    
    private func createNavigationController(rootVC: UIViewController,
                                            title: String,
                                            image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance?.backgroundColor = .beelineYelowOpacity
        UINavigationBar.appearance().standardAppearance.backgroundColor = .beelineYelowOpacity
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        
        rootVC.navigationItem.title = title
        return navController
    }
    
    private func setUpTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        tabBar.isTranslucent = true
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .beelineYelow
        makeTabBarRounded()
    }
    
    private func makeTabBarRounded () {
        let roundLayer = CAShapeLayer()
        let positionX: CGFloat = 10
        let positionY: CGFloat = 14
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 3
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: tabBar.bounds.minX + positionX,
                                                          y: tabBar.bounds.minY - positionY,
                                                          width: width, height: height),
                                      cornerRadius: height/4)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.beelineYelow.cgColor
        roundLayer.shadowColor = UIColor.black.cgColor
        roundLayer.shadowOpacity = 1
        roundLayer.shadowOffset = .zero
        roundLayer.shadowRadius = 15
        roundLayer.strokeColor = UIColor.beelineBlack.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width/5
        tabBar.itemPositioning = .centered
    }
}
