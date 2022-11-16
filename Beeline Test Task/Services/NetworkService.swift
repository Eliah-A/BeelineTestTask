//
//  Network.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import Foundation

final class NetworkService {
    
    static let Shared = NetworkService()
    
    func fetchDymmyData (callback: @escaping ([ProductModel], Error?) -> ()) {
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil else {print("Data fetch error:\(error as Error?)")
                return
            }
            do{
                let decodeResult = try JSONDecoder().decode(FetchResultModel.self, from: data)
                callback(decodeResult.products, nil)
            } catch let decodeError {
                print("Decode error:\(decodeError)")
                callback([], decodeError)
            }
        }.resume()
    }
}
