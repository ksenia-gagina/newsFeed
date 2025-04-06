//
//  NewsFeedAssembly.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

final class NewsFeedAssembly {
  func createModule(coordinator: NewsFeedCoordinator) -> UIViewController & NewsFeedPresenterInput {
    let factory = NewsFeedFactory()
    let interactor = NewsFeedInteractor()
    let view = NewsFeedView()
    let presenter = NewsFeedPresenter(moduleView: view, factory: factory, interactor: interactor, coordinator: coordinator)
    
    factory.output = presenter
    interactor.output = presenter
    view.output = presenter
    return presenter
  }
}
