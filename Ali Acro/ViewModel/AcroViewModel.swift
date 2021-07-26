//
//  AcroViewModel.swift
//  Ali Acro
//
//  Created by Ali Ahmadian shalchi on 26/07/2021.
//

import Foundation
import UIKit

struct AcroViewModel {
    
    var acroModel: AcroModel
    
    var sf: String {
        return acroModel.sf
    }
    
    var lfs: [LF] {
        return acroModel.lfs
    }

    
    
    
    
}

struct AcroLfsViewModel {
    
    var AcroLfs: LF
    
    var lf: String {
        return AcroLfs.lf
    }
    
    var freq: Int {
        return AcroLfs.freq
    }
    
    var since: Int {
        return AcroLfs.since
    }
}

