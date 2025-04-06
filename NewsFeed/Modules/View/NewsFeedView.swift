//
//  NewsFeedView.swift
//  newsFeed
//
//  Created by Ксения Гагина on 26.03.2025.
//

import UIKit

protocol NewsFeedViewInput {
  func startLoader()
  func stopLoader()
  func showError()
  func hideError()
  func configure(models: [TopHedlinesModels])
  
}

protocol NewsFeedViewOutput: AnyObject {
  func userTappedRetryRequst()
}

final class NewsFeedView: UIView  {
  
  weak var output: NewsFeedViewOutput?
  
  private let tableView = UITableView()
  private var models: [TopHedlinesModels] = []
  private let button = UIButton()
  private var spinner = UIActivityIndicatorView(style: .large)
  private var errorView = UIView()
  private var errorLabel = UILabel()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setLayout()
    initialize()
    
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  @objc func buttonAction() {
    output?.userTappedRetryRequst()
  }
}

// MARK: - NewsFeedViewInput

extension NewsFeedView: NewsFeedViewInput {
  
  func configure(models: [TopHedlinesModels]) {
    self.models = models
    tableView.reloadData()
  }
  
  func hideError() {
    errorView.isHidden = true
    tableView.isHidden = false
  }
  
  func showError() {
    errorView.isHidden = false
    tableView.isHidden = true  }
  
  func startLoader() {
    spinner.startAnimating()
    tableView.isHidden = true
    errorView.isHidden = true  }
  
  func stopLoader() {
    spinner.stopAnimating()
  }
  
  
}
// MARK: - Private funcs

private extension NewsFeedView {
  func setLayout() {
    [tableView, errorView, spinner ].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      errorView.topAnchor.constraint(equalTo: topAnchor),
      errorView.bottomAnchor.constraint(equalTo:  bottomAnchor),
      errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      errorView.trailingAnchor.constraint(equalTo:  trailingAnchor),
      
      errorLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
      errorLabel.centerYAnchor.constraint(equalTo: errorView.centerYAnchor, constant: -20),
      
      button.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
      button.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 12)
    ])
  }
  
  func initialize() {
    backgroundColor = .white
    
    tableView.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44
    tableView.separatorStyle = .none
    
    tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.reuseIdentifier)
    
    errorView.backgroundColor = .white
      errorView.isHidden = true
      errorLabel.text = "Что-то пошло не так…"
      errorLabel.textAlignment = .center

      button.setTitle("Обновить", for: .normal)
      button.setTitleColor(.systemBlue, for: .normal)

      errorView.addSubview(errorLabel)
      errorView.addSubview(button)
  }
}

// MARK: - UITableViewDataSource

extension NewsFeedView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.reuseIdentifier, for: indexPath) as? NewsFeedCell else {
      return UITableViewCell()
    }
    
    let model = models[indexPath.row]
    
    cell.configure(
      headingTitle: model.title ?? "",
      description: model.snippet ?? "",
      buttonTitle: "Подробнее",
      buttonAction: {
        print("Tapped on: \(model.title ?? "")")
      }
    )
    
    return cell
  }
}
// MARK: - UITableViewDelegate

extension NewsFeedView: UITableViewDelegate {
  
}




