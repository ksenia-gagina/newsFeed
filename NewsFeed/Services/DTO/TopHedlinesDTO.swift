//
//  TopHedlinesDTO.swift
//  newsFeed
//
//  Created by Ксения Гагина on 28.03.2025.
//
import UIKit

struct TopHedlinesDTO: Codable {
  let title: String?
  let snippet: String?
  let publishedDatetimeUtc: String?
  let sourceName: String?
  
  enum CodingKeys: String, CodingKey {
    case title
    case snippet
    case publishedDatetimeUtc = "published_datetime_utc"
    case sourceName = "source_name"
  }
}

extension TopHedlinesDTO {
  func mapTo() -> TopHedlinesModels {
    TopHedlinesModels(
      title: title,
      snippet: snippet,
      publishedDatetimeUtc: publishedDatetimeUtc,
      sourceName: sourceName
    )
  }
}

struct TopHedlinesResponseDTO: Codable {
  let data: [TopHedlinesDTO]
}
