//
//  API.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 21/06/2021.
//

import Foundation

struct API {
    
    static public func getAcroDef(acronym: String,completionHandler: @escaping (_ definitions: AcroModel?) -> Void){
        
        guard let url = URL(string: Constants.ACRO_URL + "\(acronym)") else {
            completionHandler(nil)
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: request) { (data , response , error) in
            
            if let _ = error {
                completionHandler(nil)
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode != 200 {
                completionHandler(nil)
                return
            }
            
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let models = try decoder.decode([AcroModel].self, from: data!)
                    if models.count < 1 {
                        completionHandler(nil)
                        return
                    }
                    completionHandler(models[0])
                } catch {
                    completionHandler(nil)
                    return
                }
            }
            
        }.resume()
        
    }

    
}
