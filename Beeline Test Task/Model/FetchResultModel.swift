//
//  FetchResultModel.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import Foundation

struct FetchResultModel: Decodable {
    let total: Int
    let products: [ProductModel]
}
