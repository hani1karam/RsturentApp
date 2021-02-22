//
//  CatrogyModel.swift
//  RsturentApp
//
//  Created by Hany Karam on 2/22/21.
//

import Foundation

// MARK: - CatrogyModel
struct CatrogyModel: Codable {
    let status: Bool?
    let error: String?
    let data: [CatrogyModelDatum]?
}

// MARK: - CatrogyModelDatum
struct CatrogyModelDatum: Codable {
    let id: Int?
    let name: String?
    let image: String?
}
