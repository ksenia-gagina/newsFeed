//
//  NewsFeedInteractor.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

protocol NewsFeedInteractorInput {
  /// Получить список новостей
  func getListNews()
}
protocol NewsFeedInteractorOutput: AnyObject {
  /// Вернули список фильмов 
    func  didReceiveNews(_ models: [TopHedlinesModels])
  /// Вернули ошибку если что-то пойдет не так
    func somethingWentWrong()
  }

final class NewsFeedInteractor {
  
  weak var output: NewsFeedInteractorOutput?
  private let newsService: TopHedlinesServiceProtocol = TopHedlinesService()

}

extension NewsFeedInteractor: NewsFeedInteractorInput {
  func getListNews() {
    DispatchQueue.global().async {
      self.newsService.getListTopHeding { newsList in
        DispatchQueue.main.async { [weak self] in
          if !newsList.isEmpty {
            self?.output?.didReceiveNews(newsList)
          } else {
            self?.output?.somethingWentWrong()
          }
        }
      }
    }
  }
}
