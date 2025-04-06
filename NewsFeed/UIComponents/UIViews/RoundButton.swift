 //
//  RoundButton.swift
//  newsFeed
//
//  Created by Ксения Гагина on 28.03.2025.
//

import UIKit

public final class RoundButton: UIView {
  
  private let roundButton = UIButton()
  private var buttonAction: (() -> Void)?
  
  func configure(title: String, action: (() -> Void)?) {
    roundButton.setTitle(title, for: .normal)
    buttonAction = action
    setLayout()
    initial()
  }
}

// MARK: - Private funcs

private extension RoundButton {
  func setLayout() {
    [roundButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      roundButton.heightAnchor.constraint(equalToConstant: 52),
      roundButton.widthAnchor.constraint(equalToConstant: 120),
      
      roundButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      roundButton.topAnchor.constraint(equalTo: topAnchor),
      roundButton.trailingAnchor.constraint(equalTo: trailingAnchor),
      roundButton.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func initial() {
    roundButton.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    
    
    roundButton.backgroundColor = .black
    roundButton.layer.cornerRadius = 16
    roundButton.clipsToBounds = true
    roundButton.setTitleColor(.white, for: .normal)
    roundButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
    roundButton.contentHorizontalAlignment = .center
    
  }
  
  @objc
  func touchUpInside() {
    buttonAction?()
  }
}
