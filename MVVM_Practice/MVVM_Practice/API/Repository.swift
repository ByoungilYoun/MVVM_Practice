//
//  Repository.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/06/30.
//

import Foundation

class Repository { // Repository 의 역할은 서버 모델 (UtcDateModel) 을 전달해주는것이다. 
  func fetchNow(completion : @escaping (UtcDateModel) -> Void) {
    let url = "http://worldclockapi.com/api/json/utc/now"
    
    URLSession.shared.dataTask(with: URL(string: url)!) {  data, _, _ in
      guard let data = data else {return}
      guard let model = try? JSONDecoder().decode(UtcDateModel.self, from: data) else {return}
      completion(model)
    }.resume()
  }
}
