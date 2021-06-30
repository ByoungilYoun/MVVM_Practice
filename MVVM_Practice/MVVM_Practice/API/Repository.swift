//
//  Repository.swift
//  MVVM_Practice
//
//  Created by 윤병일 on 2021/06/30.
//

import Foundation

class Repository {
  func fetchNow(completion : @escaping (Date) -> Void) {
    let url = "http://worldclockapi.com/api/json/utc/now"
    
    URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
      guard let data = data else {return}
      guard let model = try? JSONDecoder().decode(Repository.self, from: data) else {return}
      
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
      
      guard let now = formatter.date(from: model.currentDateTime) else {return}
      
      DispatchQueue.main.async {
        completion(now)
      }
    }.resume()
  }
}
