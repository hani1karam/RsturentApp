//
//  ProductModel.swift
//  RsturentApp
//
//  Created by Hany Karam on 2/22/21.
//

import Foundation

// MARK: - Welcome
struct ProductModel: Codable {
    let status: Bool?
    let error: String?
    let data: ProductModelDataClass?
}

// MARK: - DataClass
struct ProductModelDataClass: Codable {
    let id, categoryID: Int?
    let name, dataDescription, discount: String?
    let size, extra: [Extra]?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "categoryId"
        case name
        case dataDescription = "description"
        case discount, size, extra, image
    }
}

// MARK: - Extra
struct Extra: Codable {
    let id: Int?
    let name, price: String?
}
