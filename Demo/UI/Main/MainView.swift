//
//  MainView.swift
//  Tempura
//
//  Created by Andrea De Angelis on 24/07/2017.
//
//

import Foundation
import Tempura

class MainView: UIView, ViewControllerModellableView {
  
  typealias VM = MainViewModel
  
  var counter: UILabel = {
    let l = UILabel()
    return l
  }()
  
  var sub: UIButton = {
    let b = UIButton(type: .custom)
    return b
  }()
  
  var add: UIButton = {
    let b = UIButton(type: .custom)
    return b
  }()
  
  // MARK: - Setup
  func setup() {
    self.addSubview(self.counter)
    self.addSubview(self.sub)
    self.addSubview(self.add)
    self.sub.on(.touchUpInside) { [weak self] button in
      self?.subtractButtonDidTap?()
    }
    
    self.add.on(.touchUpInside) { [weak self] button in
      self?.addButtonDidTap?()
    }
  }
  
  // MARK: - Style
  func style() {
    self.backgroundColor = .white
    self.counter.textAlignment = .center
    self.sub.backgroundColor = .red
    self.sub.setTitle("sub", for: .normal)
    self.add.backgroundColor = .blue
    self.add.setTitle("add", for: .normal)
  }
  
  // MARK: - Update
  func update(oldModel: MainViewModel?) {
    self.counter.text = self.model.count
  }
  
  // MARK: - Interaction callbacks
  var subtractButtonDidTap: Interaction?
  var addButtonDidTap: Interaction?
  
  // MARK: - Layout

  override func layoutSubviews() {
    super.layoutSubviews()
    self.counter.frame = CGRect(x: 50, y: 100, width: 300, height: 60)
    self.sub.frame = CGRect(x: 50, y: 160, width: 150, height: 60)
    self.add.frame = CGRect(x: 200, y: 160, width: 150, height: 60)
  }
}
