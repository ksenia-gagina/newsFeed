//
//  NewsFeedCell.swift
//  newsFeed
//
//  Created by Ксения Гагина on 28.03.2025.
//

import  UIKit

public final class NewsFeedCell: UITableViewCell {
  
  public static let reuseIdentifier = NewsFeedCell.description()
  
  private let headingLabel = UILabel()
  private let textDescriptionLabel = UILabel()
  private let roundButtonView = RoundButton()
  private let verticalStackView = UIStackView()
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setLayout()
    initialize()
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  public func configure(
    headingTitle: String,
    description: String,
    buttonTitle: String,
    buttonAction: (() -> Void)?
  ) {
    headingLabel.text = headingTitle
    textDescriptionLabel.text = description
    roundButtonView.configure(title: buttonTitle, action: buttonAction)
       
  }
  }
private extension NewsFeedCell {
  
  func setLayout() {
    [headingLabel, textDescriptionLabel,roundButtonView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      verticalStackView.addArrangedSubview($0)
    }
    [verticalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func initialize() {
    selectionStyle = .none
    backgroundColor = .white
    contentView.backgroundColor = .white
    
    
    

  }

}
