//
//  SceneDelegate.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 09.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let tabBar = TabBarController()
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
        self.window = window
    }
}

