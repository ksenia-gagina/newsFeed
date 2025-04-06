//
//  SceneDelegate.swift
//  newsFeed
//
//  Created by Ксения Гагина on 20.03.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  private let navigationController = UINavigationController()
  private var rootCoordinator: Coordinator?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: scene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    let coordinator = NewsFeedCoordinator(navigationController: navigationController)
    coordinator.start()
    self.rootCoordinator = coordinator
  }
}
