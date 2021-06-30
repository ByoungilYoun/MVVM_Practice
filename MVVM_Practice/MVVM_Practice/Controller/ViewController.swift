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
    lb.text = ""
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
  
  let viewModel = ViewModel()
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
    // viewcontroller 에서는 viewmodel 만 바라보고 viewmodel 의 값이 변경되면 화면에 세팅하는 작업만 하면 된다.
    viewModel.onUpdated = { [weak self] in
      DispatchQueue.main.async {
        self?.dateTimeLabel.text = self?.viewModel.dateTimeString
      }
    }
    viewModel.relaod()
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
    viewModel.moveDay(day : -1)
  }
  
  @objc func nowBtnTapped() {
    dateTimeLabel.text = "Loading.."
    viewModel.relaod()
  }
  
  @objc func tomorrowBtnTapped() {
    viewModel.moveDay(day : 1)
  }
}

