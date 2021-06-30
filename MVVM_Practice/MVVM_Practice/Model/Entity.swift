//
//  UtcDateModel.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/06/29.
//

import Foundation

struct UtcDateModel : Codable { // 서버로부터 온 모델 
  let id : String
  let currentDateTime : String
  let utcOffset : String
  let isDayLightSavingsTime : Bool
  let dayOfTheWeek : String
  let timeZoneName : String
  let currentFileTime : Int
  let ordinalDate : String
  let serviceResponse : String
  
  enum CodingKeys : String, CodingKey {
    case id = "$id"
    case currentDateTime
    case utcOffset
    case isDayLightSavingsTime
    case dayOfTheWeek
    case timeZoneName
    case currentFileTime
    case ordinalDate
    case serviceResponse
  }
}
