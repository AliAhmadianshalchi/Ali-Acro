//
//  AcroViewModel.swift
//  Ali Acro
//
//  Created by Ali Ahmadian on 27/06/2021.
//

import Foundation

struct AcroViewModel {
    
    var sf: String?
    var lfs: [Lfs]
    
    init(acroModel: AcroModel) {
        self.sf = acroModel.sf
        self.lfs = acroModel.lfs
    }
}
