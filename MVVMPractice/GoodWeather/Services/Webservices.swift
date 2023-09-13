//
//  Webservice.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/24.
//

import Foundation

struct Resources<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservices {
    func load<T>(resources: Resources<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resources.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resources.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
