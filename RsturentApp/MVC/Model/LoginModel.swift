//
//  LoginModel.swift
//  RsturentApp
//
//  Created by Abdullah ahmed on 20/02/2021.
//

import Foundation
struct LoginModel : Codable {
    let status : Bool?
    let error : String?
    let data : LoginModelData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case error = "error"
        case data = "data"
    }
    
}
struct LoginModelData : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let address : String?
    let phone : String?
    let email_verified_at : String?
    let created_at : String?
    let updated_at : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case email_verified_at = "email_verified_at"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}

