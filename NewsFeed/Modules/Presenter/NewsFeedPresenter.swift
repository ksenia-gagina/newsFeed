//
//  NewsFeedPresenter.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

protocol NewsFeedPresenterInput {}
protocol NewsFeedPresenterOutput: AnyObject {}

final class NewsFeedPresenter: UIViewController {
  
  weak var output: NewsFeedPresenterOutput?
  
  let moduleView: UIView & NewsFeedViewInput
  let factory: NewsFeedFactoryInput
  let interactor: NewsFeedInteractorInput
  
  init(
    moduleView: UIView & NewsFeedViewInput,
    factory: NewsFeedFactoryInput,
    interactor: NewsFeedInteractorInput
  ) {
    self.moduleView = moduleView
    self.factory = factory
    self.interactor = interactor
    super.init (nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view = moduleView
      }
    

  override func viewDidLoad() {
    super.viewDidLoad()
    
    interactor.getListNews()
    moduleView.startLoader()
    
    
    
    
  
      }
    }


// MARK: - NewsFeedPresenterInput

extension NewsFeedPresenter: NewsFeedPresenterInput {
  
  
  
}

// MARK: - NewsFeedFactoryOutput

extension NewsFeedPresenter: NewsFeedFactoryOutput {
  
}

// MARK: -  NewsFeedInteractorOutput

extension NewsFeedPresenter:  NewsFeedInteractorOutput {
 
  func somethingWentWrong() {
    moduleView.stopLoader()
    moduleView.showError()
  }
  
  func didReceiveNews(_ models: [TopHedlinesModels]) {
    moduleView.stopLoader()
    moduleView.configure(models: models)
   
  }
}

// MARK: -  NewsFeedViewOutput

extension NewsFeedPresenter: NewsFeedViewOutput {
  func userTappedRetryRequst() {
    moduleView.hideError()
    moduleView.startLoader()
    interactor.getListNews()
  }
  
  
}

