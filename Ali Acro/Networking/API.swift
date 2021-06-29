//
//  API.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 21/06/2021.
//

import Foundation

public enum ErrorType: Error , Equatable {
    case connecctionError , serviceError , mappingError , formatError
}


class API<ResponseModel: Codable> {
    
    static public func getAcroDef(acronym: String,successClosure: @escaping (_ definitions: AcroModel?) -> Void,failureClosure: @escaping (_ definitions: ErrorType?) -> Void){
        
        guard let url = URL(string: Constants.ACRO_URL + "\(acronym)") else {
            failureClosure(ErrorType.mappingError)
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: request) { (data , response , error) in
            
            if let _ = error {
                failureClosure(ErrorType.serviceError)
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode != 200 {
                failureClosure(ErrorType.serviceError)
                return
            }
            
            if data != nil {
                do {
                    let models = try JSONDecoder().decode([AcroModel].self, from: data!)
                    if models.count < 1 {
                        failureClosure(ErrorType.formatError)
                        return
                    }
                    successClosure(models[0])
                } catch {
                    failureClosure(ErrorType.formatError)
                    return
                }
            }
            
        }.resume()
        
    }

    
}
