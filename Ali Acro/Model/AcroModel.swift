//
//  AcroModel.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 21/06/2021.
//

import Foundation

struct AcroModel: Codable {
    
    var sf: String?
    var lfs: [Lfs]
    
    init(sf: String,lfs: [Lfs]){
        self.sf = sf
        self.lfs = lfs
    }
    
}

struct Lfs: Codable {
    
    var lf: String = ""
    var frequency: Int
    var year: Int
    var variables: [Variables]
    
}

struct Variables: Codable {
    
    var lf: String = ""
    var freq: Int
    var since: Int
}
