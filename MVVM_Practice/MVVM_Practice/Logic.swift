//
//  Logic.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/07/01.
//

import Foundation

class Logic {
  func yesterDayBtnTapped(now : Date) -> Date {
    guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now) else {return now}
    return yesterday
  }
  
  func nowBtnTapped() {
    
  }
  
  func tomorrowBtnTapped(now : Date) -> Date {
    guard let tomorrow = Calendar.current.date(byAdding: .day, value: +1, to: now) else { return now}
    return tomorrow
  }
}
