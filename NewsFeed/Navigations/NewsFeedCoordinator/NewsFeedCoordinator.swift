//
//  NewsFeedCoordinator.swift
//  newsFeed
//
//  Created by Ксения Гагина on 05.04.2025.
//

import UIKit

final class NewsFeedCoordinator: Coordinator {
  
  private let navigationController: UINavigationController
  private var newsFeedModule: UIViewController?

      init(navigationController: UINavigationController) {
          self.navigationController = navigationController
      }

  func start() {
    openNewsFeed()

  }
  }
  
// MARK: - NewsFeedAssembly

private extension NewsFeedCoordinator {
  func openNewsFeed() {
    let module = NewsFeedAssembly().createModule(coordinator: self)
  newsFeedModule = module
    navigationController.pushViewController(module, animated: true)
  }
}
