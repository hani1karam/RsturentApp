//
//  NetworkManager.swift
//  RsturentApp
//
//  Created by Abdullah ahmed on 20/02/2021.
//

import Foundation
import Alamofire

class NetWorkManager {
    static let instance = NetWorkManager() // Single Tone
    func API<T: Codable>(method: HTTPMethod, url: String, parameters:[String:Any]? = nil, header: [String:String]?  = nil, completion: @escaping (_ error: Error?, _ status: Bool?, _ response: T?)->Void) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.methodDependent, headers: header)
            .responseJSON { res -> Void in
                switch res.result
                {
                case .failure(let error):
                    completion(error,nil,nil)
                case .success(_):
                    if let dict = res.result.value as? Dictionary<String, Any>{
                        print(res.result)
                        guard let status = dict["status"] as? Bool else{return}
                        do{
                            guard let data = res.data else { return }
                            let response = try JSONDecoder().decode(T.self, from: data)
                            completion(nil,status,response)
                        }catch let err{
                            print("Error In Decode Data \(err.localizedDescription)")
                            completion(err,false,nil)
                        }
                    }else{
                        completion(nil,false,nil)
                    }
                }
        }
        
    }
    
}
