//
//  ViewModel.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/07/01.
//

import Foundation

class ViewModel {
  var onUpdated : () -> Void = {}
  
  var dateTimeString : String = "Loading..." { // 화면에 보여져야할 값 // View 를 위한 Model : ViewModel
    didSet {
        onUpdated()
    }
  }
  
  
  let service = Service()
  
  
  private func dateToString(date : Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
    return  formatter.string(from: date)
  }
  
  func relaod() {
    // Model 을 화면을 위한 ViewModel 로 변형하는 역할도 하고있다. 
    service.fetchNow { [weak self] model in
      guard let self = self else {return}
      let dateString = self.dateToString(date: model.currentDateTime)
      self.dateTimeString = dateString
    }
  }
  
  func moveDay(day : Int) {
    service.moveDay(day: day)
    dateToString(date: service.currentModel.currentDateTime)
  }
}
