//
//  RegisterModel.swift
//  RsturentApp
//
//  Created by Abdullah ahmed on 20/02/2021.
//

import Foundation
struct RegisterModel : Codable {
    let status : Bool?
    let error : String?
    let data : ResigterModelData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case error = "error"
        case data = "data"
    }
}
struct ResigterModelData : Codable {
    let email : String?
    let name : String?
    let phone : String?
    let address : String?
    let updated_at : String?
    let created_at : String?
    let id : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case email = "email"
        case name = "name"
        case phone = "phone"
        case address = "address"
        case updated_at = "updated_at"
        case created_at = "created_at"
        case id = "id"
    }
}
