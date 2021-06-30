//
//  Service.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/07/01.
//

import Foundation

class Service { // Repository 를 이용해서 서버 모델 가져온것을 Logic(Service) 에서 사용하는 Model 로 바꿔줬다.
  
  var currentModel = Model(currentDateTime: Date())
  
  let repository = Repository()
  
  func fetchNow(completion : @escaping(Model) -> Void) {
    
    // Entity -> Model 로 한번 변형이 일어났다.
    repository.fetchNow { [weak self] UtcDateModel in
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
      guard let now = formatter.date(from: UtcDateModel.currentDateTime) else {return}
      
      let model = Model(currentDateTime: now)
      self?.currentModel = model
      completion(model)
    }
  }
  
  func moveDay( day : Int) {
    guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else {return}
    currentModel.currentDateTime = movedDay
  }
}
