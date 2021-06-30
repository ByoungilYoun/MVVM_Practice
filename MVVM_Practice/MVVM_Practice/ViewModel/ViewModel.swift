//
//  ViewModel.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/07/01.
//

import Foundation

class ViewModel {
  var dateTimeString : String = "Loading..."
  
  
  private func dateToString(date : Date) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
    dateTimeString = formatter.string(from: date)
  }
}
