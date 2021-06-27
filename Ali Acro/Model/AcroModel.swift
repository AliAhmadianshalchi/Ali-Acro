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
    
}

struct Lfs: Codable {
    
    var lf: String = ""
    var freq: Int
    var since: Int
    
}

