//
//  ProductModel.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 11.11.2022.
//

import Foundation

struct ProductModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Float
    let discountPercentage: Float
    let rating: Float
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

