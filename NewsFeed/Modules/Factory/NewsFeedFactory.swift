//
//  NewsFeedFactory.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

protocol NewsFeedFactoryInput {}
protocol NewsFeedFactoryOutput: AnyObject {}


final class NewsFeedFactory {
  
  weak var output: NewsFeedFactoryOutput?
}

extension NewsFeedFactory: NewsFeedFactoryInput {
  
}
