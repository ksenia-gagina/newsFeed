//
//  TopHedlinesService.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

protocol TopHedlinesServiceProtocol {
  func getListTopHeding(completion: (([TopHedlinesModels]) -> Void)?)
}

final class TopHedlinesService: TopHedlinesServiceProtocol {

  func getListTopHeding(completion: (([TopHedlinesModels]) -> Void)?) {
    DispatchQueue.global().async {
      let baseURLString = "https://real-time-news-data.p.rapidapi.com/top-headlines"
      
      guard var urlComponents = URLComponents(string: baseURLString) else {
        fatalError("Некорректный URL")
      }
      
      urlComponents.queryItems = [
        URLQueryItem(name: "limit", value: "30"),
        URLQueryItem(name: "country", value: "RU"),
        URLQueryItem(name: "lang", value: "RU")
        ]
        
        guard let url = urlComponents.url else {
          fatalError("Не удалось создать URL с query параметрами")
        }
      
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      request.setValue("real-time-news-data.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
      request.setValue("4ae79544f5msh80672af9295b4c0p18fde4jsnfd26c98c1013", forHTTPHeaderField: "X-RapidAPI-Key")

      
      let session = URLSession.shared
      
      let task = session.dataTask(with: request) { data, response, error in
        if let error {
          print("\(error.localizedDescription)")
          return
        }
        
        guard let data else {
          print("Данные не получены")
          return
        }
        
        do {
          let apiResponce = try JSONDecoder().decode(TopHedlinesResponseDTO.self, from: data)
          let models = apiResponce.data.map { $0.mapTo() }
          completion?(models) 
          print("Полученный объект:\(apiResponce)")
        } catch {
          print("Ошибка парсинга JSON:\(error)")
        }
      }
      
      task.resume()
    }
  }
}

