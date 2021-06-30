//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/06/29.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let dateTimeLabel : UILabel = {
    let lb = UILabel()
    lb.text = "2021년 06월 29일 12시 23분"
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    return lb
  }()
  
  private let yesterDayButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Yesterday", for: .normal)
    bt.setTitleColor(.blue, for: .normal)
    bt.addTarget(self, action: #selector(yesterDayBtnTapped), for: .touchUpInside)
    return bt
  }()
  
  private let nowButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Now", for: .normal)
    bt.setTitleColor(.blue, for: .normal)
    bt.addTarget(self, action: #selector(nowBtnTapped), for: .touchUpInside)
    return bt
  }()
  
  private let tomorrowButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Tomorrow", for: .normal)
    bt.setTitleColor(.blue, for: .normal)
    bt.addTarget(self, action: #selector(tomorrowBtnTapped), for: .touchUpInside)
    return bt
  }()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }

  //MARK: - Functions
  private func setUI() {
    view.backgroundColor = .white
    [dateTimeLabel, yesterDayButton, nowButton, tomorrowButton].forEach {
      view.addSubview($0)
    }
    
    dateTimeLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.height.equalTo(30)
    }
    
    yesterDayButton.snp.makeConstraints {
      $0.top.equalTo(nowButton)
      $0.trailing.equalTo(nowButton.snp.leading).offset(-20)
      $0.width.equalTo(100)
      $0.height.equalTo(30)
    }
    
    nowButton.snp.makeConstraints {
      $0.top.equalTo(dateTimeLabel.snp.bottom).offset(30)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(30)
      $0.width.equalTo(50)
    }
    
    tomorrowButton.snp.makeConstraints {
      $0.top.equalTo(nowButton)
      $0.leading.equalTo(nowButton.snp.trailing).offset(20)
      $0.height.equalTo(nowButton)
      $0.width.equalTo(100)
    }
  }
  
  

  //MARK: - @objc func
  @objc func yesterDayBtnTapped() {
    
  }
  
  @objc func nowBtnTapped() {
    
  }
  
  @objc func tomorrowBtnTapped() {
    
  }
}

